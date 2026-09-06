import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPanelApi extends Mock implements PanelApi {}

void main() {
  late ProviderContainer container;
  late MockPanelApi api;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    api = MockPanelApi();
    container = ProviderContainer(
      overrides: [
        panelApiProvider.overrideWith((ref) => api),
        profilesStreamProvider.overrideWith((ref) => const Stream.empty()),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('PanelAction', () {
    test('login saves auth data and returns no challenge', () async {
      when(() => api.login(any(), any())).thenAnswer(
        (_) async => const PanelLoginResult(authData: 'auth123'),
      );
      when(() => api.getSubscribe()).thenAnswer((_) async => null);

      final challenge = await container.read(
        panelActionProvider.notifier,
      ).login(
        email: 'a@b.com',
        password: 'password',
      );

      expect(challenge, isNull);
      expect(await container.read(panelSessionProvider.future), 'auth123');
    });

    test('login returns challenge when two-factor is required', () async {
      when(() => api.login(any(), any())).thenAnswer(
        (_) async => const PanelLoginResult(challenge: 'challenge123'),
      );

      final challenge = await container.read(
        panelActionProvider.notifier,
      ).login(
        email: 'a@b.com',
        password: 'password',
      );

      expect(challenge, 'challenge123');
      expect(await container.read(panelSessionProvider.future), isNull);
    });

    test('verify2fa saves auth data', () async {
      when(() => api.verify2fa(any(), any())).thenAnswer((_) async => 'auth123');
      when(() => api.getSubscribe()).thenAnswer((_) async => null);

      await container.read(panelActionProvider.notifier).verify2fa(
        challenge: 'challenge123',
        code: '123456',
      );

      expect(await container.read(panelSessionProvider.future), 'auth123');
    });

    test('register saves auth data', () async {
      when(
        () => api.register(
          email: any(named: 'email'),
          password: any(named: 'password'),
          emailCode: any(named: 'emailCode'),
          inviteCode: any(named: 'inviteCode'),
        ),
      ).thenAnswer((_) async => 'auth123');
      when(() => api.getSubscribe()).thenAnswer((_) async => null);

      await container.read(panelActionProvider.notifier).register(
        email: 'a@b.com',
        password: 'password',
        emailCode: '123456',
      );

      expect(await container.read(panelSessionProvider.future), 'auth123');
    });

    test('logout clears session', () async {
      await container.read(panelSessionProvider.notifier).save('auth123');

      await container.read(panelActionProvider.notifier).logout();

      expect(await container.read(panelSessionProvider.future), isNull);
    });

    test('ensureSubscription does nothing without a session', () async {
      await container.read(panelActionProvider.notifier).ensureSubscription();

      verifyNever(() => api.getSubscribe());
    });

    test('ensureSubscription clears expired session', () async {
      await container.read(panelSessionProvider.notifier).save('auth123');
      when(
        () => api.getSubscribe(),
      ).thenThrow(const PanelApiException('未登录或登陆已过期'));

      await container.read(panelActionProvider.notifier).ensureSubscription();

      expect(await container.read(panelSessionProvider.future), isNull);
    });

    test('ensureSubscription keeps session when no subscription exists', () async {
      await container.read(panelSessionProvider.notifier).save('auth123');
      when(() => api.getSubscribe()).thenAnswer((_) async => null);

      await container.read(panelActionProvider.notifier).ensureSubscription();

      expect(await container.read(panelSessionProvider.future), 'auth123');
    });
  });
}
