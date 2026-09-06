part of '../panel.dart';

const _panelProfileIdKey = 'panel_profile_id';

@Riverpod(keepAlive: true)
class PanelProfileId extends _$PanelProfileId {
  @override
  Future<int?> build() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(_panelProfileIdKey);
  }

  Future<void> save(int profileId) async {
    state = AsyncData(profileId);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(_panelProfileIdKey, profileId);
  }

  Future<void> clear() async {
    state = const AsyncData(null);
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_panelProfileIdKey);
  }
}
