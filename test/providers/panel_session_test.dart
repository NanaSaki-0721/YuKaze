import 'package:fl_clash/providers/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PanelSession provider', () {
    test('loads persisted auth data', () async {
      SharedPreferences.setMockInitialValues({'panel_auth_data': 'abc'});
      final value = await container.read(panelSessionProvider.future);
      expect(value, 'abc');
    });

    test('starts empty without persisted data', () async {
      SharedPreferences.setMockInitialValues({});
      final value = await container.read(panelSessionProvider.future);
      expect(value, isNull);
    });

    test('save persists and updates state', () async {
      SharedPreferences.setMockInitialValues({});
      await container.read(panelSessionProvider.notifier).save('abc');
      final value = await container.read(panelSessionProvider.future);
      expect(value, 'abc');
      final preferences = await SharedPreferences.getInstance();
      expect(preferences.getString('panel_auth_data'), 'abc');
    });

    test('clear removes persisted data', () async {
      SharedPreferences.setMockInitialValues({'panel_auth_data': 'abc'});
      await container.read(panelSessionProvider.future);
      await container.read(panelSessionProvider.notifier).clear();
      final value = await container.read(panelSessionProvider.future);
      expect(value, isNull);
      final preferences = await SharedPreferences.getInstance();
      expect(preferences.getString('panel_auth_data'), isNull);
    });
  });
}
