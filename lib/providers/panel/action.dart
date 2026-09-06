part of '../panel.dart';

@Riverpod(keepAlive: true)
class PanelAction extends _$PanelAction {
  @override
  void build() {}

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final result = await ref.read(panelApiProvider).login(email, password);
    final challenge = result.challenge;
    if (challenge != null) {
      return challenge;
    }
    final authData = result.authData;
    if (authData == null) {
      throw const PanelApiException('invalid login response');
    }
    await _completeLogin(authData);
    return null;
  }

  Future<void> verify2fa({
    required String challenge,
    required String code,
  }) async {
    final authData = await ref
        .read(panelApiProvider)
        .verify2fa(challenge, code);
    await _completeLogin(authData);
  }

  Future<void> sendEmailVerify(String email) async {
    await ref.read(panelApiProvider).sendEmailVerify(email);
  }

  Future<void> register({
    required String email,
    required String password,
    required String emailCode,
    String? inviteCode,
  }) async {
    final authData = await ref.read(panelApiProvider).register(
      email: email,
      password: password,
      emailCode: emailCode,
      inviteCode: inviteCode,
    );
    await _completeLogin(authData);
  }

  Future<void> logout() async {
    await ref.read(panelSessionProvider.notifier).clear();
    await ref.read(panelProfileIdProvider.notifier).clear();
  }

  Future<void> _completeLogin(String authData) async {
    await ref.read(panelSessionProvider.notifier).save(authData);
    await ensureSubscription();
  }

  Future<void> ensureSubscription() async {
    final session = ref.read(panelSessionProvider).value;
    if (session == null) {
      return;
    }
    try {
      final profileId = await ref.read(panelProfileIdProvider.future);
      final profiles = ref.read(profilesProvider);
      final existingProfile = profiles.getProfile(profileId);
      if (existingProfile != null) {
        await ref
            .read(profilesActionProvider.notifier)
            .updateProfile(existingProfile);
        final refreshed = ref.read(profilesProvider).getProfile(profileId);
        if (refreshed != null && refreshed.label != existingProfile.label) {
          ref
              .read(profilesProvider.notifier)
              .put(refreshed.copyWith(label: existingProfile.label));
        }
        return;
      }
      final subscribe = await ref.read(panelApiProvider).getSubscribe();
      final subscribeUrl = subscribe?.subscribeUrl;
      if (subscribeUrl == null || subscribeUrl.isEmpty) {
        return;
      }
      final label = SiteConfig.siteName.isEmpty
          ? appName
          : SiteConfig.siteName;
      final profile = await Profile.normal(
        url: subscribeUrl,
        label: label,
      ).update();
      final pinnedProfile = profile.copyWith(label: label);
      await ref.read(panelProfileIdProvider.notifier).save(profile.id);
      ref.read(profilesActionProvider.notifier).putProfile(pinnedProfile);
    } on PanelApiException catch (error) {
      if (_isSessionExpired(error.message)) {
        await ref.read(panelSessionProvider.notifier).clear();
        return;
      }
      commonPrint.log(error.message, logLevel: LogLevel.warning);
    } catch (error) {
      commonPrint.log(error.toString(), logLevel: LogLevel.warning);
    }
  }

  bool _isSessionExpired(String message) {
    final lowerMessage = message.toLowerCase();
    return message.contains('未登录') ||
        message.contains('已过期') ||
        lowerMessage.contains('expired') ||
        lowerMessage.contains('unauthorized');
  }
}
