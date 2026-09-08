import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/views/panel/shop.dart';
import 'package:fl_clash/views/proxies/common.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView>
    with WidgetsBindingObserver {
  var _isForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final lifecycleState = WidgetsBinding.instance.lifecycleState;
    _isForeground =
        lifecycleState == null || lifecycleState == AppLifecycleState.resumed;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isForeground = state == AppLifecycleState.resumed;
    if (_isForeground == isForeground) {
      return;
    }
    setState(() {
      _isForeground = isForeground;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final traffic = ref.watch(
      trafficsProvider.select((state) => state.list.safeLast(const Traffic())),
    );
    final isMobile = ref.watch(isMobileViewProvider);
    return TickerMode(
      enabled: _isForeground,
      child: CommonScaffold(
        title: appLocalizations.dashboard,
        actions: [
          Text(
            traffic.speedText,
            style: context.textTheme.titleMedium?.toSoftBold,
          ),
          const SizedBox(width: 12),
        ],
        body: LayoutBuilder(
          builder: (_, constraints) {
            final controlsAvailableWidth = constraints.maxWidth - 32;
            final controlWidth = isMobile
                ? controlsAvailableWidth * 0.75
                : (controlsAvailableWidth / 3).clamp(240.0, 360.0);
            final networkControlsWidth = (controlWidth * 0.78).clamp(
              210.0,
              280.0,
            );
            final controlsBottom = isMobile
                ? floatingDockBottomSpace + 8
                : 32.0;
            return Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: controlsBottom + 196,
                  child: const Center(
                    child: _DashboardEntrance(
                      duration: Duration(milliseconds: 420),
                      child: _CircularStartButton(),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: controlsBottom,
                  child: Center(
                    child: _DashboardEntrance(
                      duration: const Duration(milliseconds: 560),
                      child: _DashboardControls(
                        controlWidth: controlWidth,
                        networkControlsWidth: networkControlsWidth,
                        showNetworkControls:
                            system.isDesktop &&
                            !isMobile &&
                            constraints.maxWidth >= 500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CircularStartButton extends ConsumerWidget {
  const _CircularStartButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStart = ref.watch(isStartProvider);
    final runTime = ref.watch(runTimeProvider);
    final appLocalizations = context.appLocalizations;
    final foreground = isStart ? Colors.white : context.colorScheme.onSurface;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            ref.read(commonActionProvider.notifier).toggleRunning();
          },
          child: SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 360),
                  curve: Curves.easeOutCubic,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isStart
                          ? brandPrimary.withValues(alpha: 0.45)
                          : context.colorScheme.outline,
                      width: isStart ? 3 : 1,
                    ),
                    boxShadow: isStart
                        ? [
                            BoxShadow(
                              color: brandPrimary.withValues(alpha: 0.22),
                              blurRadius: 28,
                              offset: const Offset(0, 10),
                            ),
                          ]
                        : null,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 360),
                  curve: Curves.easeOutCubic,
                  width: isStart ? 154 : 200,
                  height: isStart ? 154 : 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isStart
                        ? brandPrimary
                        : context.colorScheme.surfaceContainer,
                    border: isStart
                        ? null
                        : Border.all(color: context.colorScheme.outline),
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    size: isStart ? 60 : 72,
                    color: foreground,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        AnimatedSize(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: isStart
                ? Row(
                    key: const ValueKey('running'),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        appLocalizations.panelTapStop,
                        style: context.textTheme.labelMedium?.toLight,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        utils.getTimeText(runTime),
                        style: context.textTheme.labelMedium?.toLight,
                      ),
                    ],
                  )
                : Text(
                    appLocalizations.panelTapStart,
                    key: const ValueKey('stopped'),
                    style: context.textTheme.labelMedium?.toLight,
                  ),
          ),
        ),
      ],
    );
  }
}

class _DashboardEntrance extends StatelessWidget {
  final Duration duration;
  final Widget child;

  const _DashboardEntrance({required this.duration, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
    );
  }
}

class _DashboardControls extends StatelessWidget {
  final double controlWidth;
  final double networkControlsWidth;
  final bool showNetworkControls;

  const _DashboardControls({
    required this.controlWidth,
    required this.networkControlsWidth,
    required this.showNetworkControls,
  });

  @override
  Widget build(BuildContext context) {
    final modeControls = SizedBox(
      key: const Key('dashboard-mode-controls'),
      width: controlWidth,
      child: const _ModeControls(),
    );
    if (!showNetworkControls) {
      return modeControls;
    }
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: networkControlsWidth,
            child: const _DashboardNetworkControlsCard(),
          ),
          const SizedBox(width: 12),
          modeControls,
        ],
      ),
    );
  }
}

class _ModeControls extends StatelessWidget {
  const _ModeControls();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ModeSlider(),
        SizedBox(height: 12),
        _NodeSelectButton(),
        SizedBox(height: 12),
        _SubscriptionCard(),
      ],
    );
  }
}

class _DashboardNetworkControlsCard extends ConsumerWidget {
  const _DashboardNetworkControlsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final systemProxy = ref.watch(
      networkSettingProvider.select((state) => state.systemProxy),
    );
    final tun = ref.watch(
      patchClashConfigProvider.select((state) => state.tun.enable),
    );
    return Card(
      key: const Key('dashboard-network-controls'),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: _DashboardNetworkControl(
                key: const Key('dashboard-system-proxy'),
                icon: Icons.settings_ethernet_rounded,
                label: appLocalizations.systemProxy,
                value: systemProxy,
                onChanged: (value) {
                  ref
                      .read(networkSettingProvider.notifier)
                      .update((state) => state.copyWith(systemProxy: value));
                },
              ),
            ),
            Divider(height: 1, color: context.colorScheme.outlineVariant),
            Expanded(
              child: _DashboardNetworkControl(
                key: const Key('dashboard-tun'),
                icon: Icons.stacked_line_chart,
                label: appLocalizations.tun,
                value: tun,
                onChanged: (value) {
                  ref
                      .read(patchClashConfigProvider.notifier)
                      .update((state) => state.copyWith.tun(enable: value));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardNetworkControl extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _DashboardNetworkControl({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Icon(icon, color: context.colorScheme.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleSmall,
              ),
            ),
            const SizedBox(width: 8),
            Switch(
              key: ValueKey('$label-switch'),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeSlider extends ConsumerWidget {
  const _ModeSlider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(
      patchClashConfigProvider.select((state) => state.mode),
    );
    final selectedIndex = Mode.values.indexOf(mode);
    final labelStyle = context.textTheme.labelMedium ?? const TextStyle();
    return Container(
      key: const Key('dashboard-mode-slider'),
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final segmentWidth = constraints.maxWidth / Mode.values.length;
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                AnimatedPositioned(
                  key: const Key('dashboard-mode-selection'),
                  duration: const Duration(milliseconds: 420),
                  curve: Curves.easeOutBack,
                  left: segmentWidth * selectedIndex,
                  top: 0,
                  bottom: 0,
                  width: segmentWidth,
                  child: DecoratedBox(
                    key: const Key('dashboard-mode-selection-indicator'),
                    decoration: BoxDecoration(
                      color: brandPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (final item in Mode.values)
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            globalState.container
                                .read(setupActionProvider.notifier)
                                .changeMode(item);
                          },
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 240),
                              curve: Curves.easeOutCubic,
                              style: labelStyle.copyWith(
                                color: item == mode
                                    ? Colors.white
                                    : context.colorScheme.onSurfaceVariant,
                              ),
                              child: Text(Intl.message(item.name)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NodeSelectButton extends ConsumerWidget {
  const _NodeSelectButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    return ShadButton(
      onPressed: () {
        showSheet(
          context: context,
          props: const SheetProps(isScrollControlled: true),
          builder: (_) => const _NodeSelectorSheet(),
        );
      },
      child: Text(appLocalizations.panelSelectNode),
    );
  }
}

class _SubscriptionCard extends ConsumerWidget {
  const _SubscriptionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscribeInfo = ref.watch(subscribeInfoProvider).value;
    final userInfo = ref.watch(userInfoProvider).value;
    final plan = subscribeInfo?.plan ?? userInfo?.plan;
    final expiredAt = userInfo?.expiredAt ?? subscribeInfo?.expiredAt;
    final isRenewable = plan?.id != null && plan?.renew != 0;
    final expiry = expiredAt == null || expiredAt == 0
        ? context.appLocalizations.infiniteTime
        : DateTime.fromMillisecondsSinceEpoch(expiredAt * 1000).show;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.workspace_premium_outlined,
              color: context.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan?.name ?? context.appLocalizations.panelNoSubscription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${context.appLocalizations.panelExpiry} $expiry',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.toLight,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.tonal(
              onPressed: isRenewable
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OrderConfirmView(
                            planId: plan?.id,
                            plan: plan,
                            isRenewal: true,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Text(context.appLocalizations.panelRenew),
            ),
          ],
        ),
      ),
    );
  }
}

class _NodeSelectorSheet extends ConsumerStatefulWidget {
  const _NodeSelectorSheet();

  @override
  ConsumerState<_NodeSelectorSheet> createState() => _NodeSelectorSheetState();
}

class _NodeSelectorSheetState extends ConsumerState<_NodeSelectorSheet> {
  String? _testedGroupName;

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(currentGroupsStateProvider).value;
    final currentGroupName = ref.watch(
      currentProfileProvider.select((state) => state?.currentGroupName),
    );
    final group =
        groups.getGroup(currentGroupName ?? '') ??
        (groups.isEmpty ? null : groups.first);
    if (group == null) {
      return NullStatus(label: context.appLocalizations.noData);
    }
    if (_testedGroupName != group.name) {
      _testedGroupName = group.name;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await delayTest(group.all, group.testUrl);
        if (mounted) {
          ref.read(proxiesActionProvider.notifier).updateGroupsDebounce();
        }
      });
    }
    final selectedName = ref.watch(selectedProxyNameProvider(group.name));
    return AdaptiveSheetScaffold(
      title: group.name,
      actions: [
        IconButtonData(
          icon: Icons.network_ping,
          onPressed: () async {
            await delayTest(group.all, group.testUrl);
            ref.read(proxiesActionProvider.notifier).updateGroupsDebounce();
          },
        ),
      ],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: group.all.length,
        itemBuilder: (_, index) {
          final proxy = group.all[index];
          final selected = proxy.name == selectedName;
          final delay = ref.watch(
            delayProvider(proxyName: proxy.name, testUrl: group.testUrl),
          );
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                ref
                    .read(profilesActionProvider.notifier)
                    .updateCurrentSelectedMap(group.name, proxy.name);
                ref
                    .read(proxiesActionProvider.notifier)
                    .changeProxyDebounce(group.name, proxy.name);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selected
                      ? brandPrimary.withValues(alpha: 0.08)
                      : context.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selected
                        ? brandPrimary
                        : context.colorScheme.outline,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: ListTile(
                  dense: true,
                  title: Text(
                    proxy.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    delay == null
                        ? '-'
                        : delay == 0
                        ? '...'
                        : delay > 0
                        ? '$delay ms'
                        : 'Timeout',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: delay != null && delay > 0
                          ? utils.getDelayColor(delay)
                          : context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
