part of '../action.dart';

void _syncModeSelection(Ref ref, Mode previousMode, Mode nextMode) {
  if (previousMode == nextMode) {
    return;
  }
  final profile = ref.read(currentProfileProvider);
  if (profile == null) {
    return;
  }
  final selectedMap = Map<String, String>.from(profile.selectedMap);
  final currentGroupName = profile.currentGroupName;
  if (nextMode == Mode.global) {
    final selected = _resolveCurrentProxy(ref, selectedMap, currentGroupName);
    if (selected != null) {
      selectedMap[GroupName.GLOBAL.name] = selected;
      ref
          .read(profilesProvider.notifier)
          .updateProfile(profile.id, (p) => p.copyWith(selectedMap: selectedMap));
      _applySelectionToCore(ref, GroupName.GLOBAL.name, selected);
    }
  } else if (previousMode == Mode.global && currentGroupName != null) {
    final selected = selectedMap[GroupName.GLOBAL.name];
    if (selected != null && selected.isNotEmpty) {
      selectedMap[currentGroupName] = selected;
      ref
          .read(profilesProvider.notifier)
          .updateProfile(profile.id, (p) => p.copyWith(selectedMap: selectedMap));
      _applySelectionToCore(ref, currentGroupName, selected);
    }
  }
}

void _applySelectionToCore(Ref ref, String groupName, String proxyName) {
  unawaited(() async {
    try {
      await ref
          .read(proxiesActionProvider.notifier)
          .changeProxy(groupName: groupName, proxyName: proxyName);
    } catch (error) {
      commonPrint.log(
        'sync mode selection failed: $error',
        logLevel: LogLevel.warning,
      );
    }
  }());
}

String? _resolveCurrentProxy(
  Ref ref,
  Map<String, String> selectedMap,
  String? currentGroupName,
) {
  final selected = selectedMap[currentGroupName ?? ''];
  if (selected != null && selected.isNotEmpty) {
    return selected;
  }
  final globalSelected = selectedMap[GroupName.GLOBAL.name];
  if (globalSelected != null && globalSelected.isNotEmpty) {
    return globalSelected;
  }
  for (final entry in selectedMap.entries) {
    if (entry.value.isNotEmpty) {
      return entry.value;
    }
  }
  final groups = ref.read(currentGroupsStateProvider).value;
  Group? targetGroup;
  for (final group in groups) {
    if (group.name == currentGroupName) {
      targetGroup = group;
      break;
    }
  }
  targetGroup ??= groups.isEmpty ? null : groups.first;
  if (targetGroup != null && targetGroup.now?.isNotEmpty == true) {
    return targetGroup.now;
  }
  return null;
}

@Riverpod(keepAlive: true)
class CommonAction extends _$CommonAction {
  @override
  void build() {}

  void toggleRunning() {
    final running = !ref.read(isStartProvider);
    ref
        .read(setupActionProvider.notifier)
        .setRunning(running, initialize: running && !ref.read(initProvider));
  }

  void updateSpeedStatistics() {
    ref
        .read(appSettingProvider.notifier)
        .update((state) => state.copyWith(showTrayTitle: !state.showTrayTitle));
  }

  void updateMode() {
    final currentMode = ref.read(patchClashConfigProvider).mode;
    final index = Mode.values.indexWhere((item) => item == currentMode);
    if (index == -1) {
      return;
    }
    final nextIndex = index + 1 > Mode.values.length - 1 ? 0 : index + 1;
    final nextMode = Mode.values[nextIndex];
    _syncModeSelection(ref, currentMode, nextMode);
    ref
        .read(patchClashConfigProvider.notifier)
        .update((state) => state.copyWith(mode: nextMode));
  }

  Future<void> updateTraffic() async {
    final onlyStatisticsProxy = ref.read(
      appSettingProvider.select((state) => state.onlyStatisticsProxy),
    );
    try {
      final traffic = await coreController.getTraffic(onlyStatisticsProxy);
      ref.read(trafficsProvider.notifier).addTraffic(traffic);
      ref.read(totalTrafficProvider.notifier).value = await coreController
          .getTotalTraffic(onlyStatisticsProxy);
    } catch (error) {
      commonPrint.log(
        'updateTraffic error: $error',
        logLevel: coreFailureLogLevel(error),
      );
    }
  }

  Future<void> autoCheckUpdate() async {
    if (!ref.read(appSettingProvider).autoCheckUpdate) return;
    final res = await request.checkForUpdate();
    checkUpdateResultHandle(data: res);
  }

  Future<void> checkUpdateResultHandle({
    Map<String, dynamic>? data,
    bool isUser = false,
  }) async {
    if (data != null) {
      final tagName = data['tag_name'];
      final body = data['body'];
      final submits = utils.parseReleaseBody(body);
      final context = globalState.navigatorKey.currentContext!;
      final textTheme = context.textTheme;
      final res = await globalState.showMessage(
        title: currentAppLocalizations.discoverNewVersion,
        message: TextSpan(
          text: '$tagName \n',
          style: textTheme.headlineSmall,
          children: [
            TextSpan(text: '\n', style: textTheme.bodyMedium),
            for (final submit in submits)
              TextSpan(text: '- $submit \n', style: textTheme.bodyMedium),
          ],
        ),
        confirmText: currentAppLocalizations.goDownload,
        cancelText: isUser ? null : currentAppLocalizations.noLongerRemind,
      );
      if (res == true) {
        launchUrl(Uri.parse('https://github.com/$repository/releases/latest'));
      } else if (!isUser && res == false) {
        ref
            .read(appSettingProvider.notifier)
            .update((state) => state.copyWith(autoCheckUpdate: false));
      }
    } else if (isUser) {
      globalState.showMessage(
        title: currentAppLocalizations.checkUpdate,
        message: TextSpan(text: currentAppLocalizations.checkUpdateError),
      );
    }
  }
}
