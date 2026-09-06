part of '../panel.dart';

const _panelAuthDataKey = 'panel_auth_data';

enum PanelAuthState { loading, unauthenticated, authenticated }

@riverpod
PanelAuthState panelAuthState(Ref ref) {
  final session = ref.watch(panelSessionProvider);
  if (session.isLoading) {
    return PanelAuthState.loading;
  }
  if (session.value?.isNotEmpty == true) {
    return PanelAuthState.authenticated;
  }
  return PanelAuthState.unauthenticated;
}

@Riverpod(keepAlive: true)
class PanelSession extends _$PanelSession {
  @override
  Future<String?> build() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_panelAuthDataKey);
  }

  Future<void> save(String authData) async {
    state = AsyncData(authData);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_panelAuthDataKey, authData);
  }

  Future<void> clear() async {
    state = const AsyncData(null);
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_panelAuthDataKey);
  }
}
