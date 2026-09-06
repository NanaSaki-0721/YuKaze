import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
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
            final controlWidth =
                (constraints.maxWidth / 3).clamp(160.0, 240.0);
            return Stack(
              children: [
                const Center(
                  child: _DashboardEntrance(
                    duration: Duration(milliseconds: 420),
                    child: _CircularStartButton(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: isMobile ? floatingDockBottomSpace + 8 : 32,
                  child: Center(
                    child: _DashboardEntrance(
                      duration: const Duration(milliseconds: 560),
                      child: _ModeControls(width: controlWidth),
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
        Text(
          isStart ? appLocalizations.panelTapStop : appLocalizations.panelTapStart,
          style: context.textTheme.labelMedium?.toLight,
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

class _ModeControls extends ConsumerWidget {
  final double width;

  const _ModeControls({required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ModeSlider(),
          SizedBox(height: 12),
          _NodeSelectButton(),
        ],
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
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: Row(
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
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: item == mode ? brandPrimary : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    Intl.message(item.name),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: item == mode
                          ? Colors.white
                          : context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
        ],
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

class _NodeSelectorSheet extends ConsumerWidget {
  const _NodeSelectorSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(currentGroupsStateProvider).value;
    final currentGroupName = ref.watch(
      currentProfileProvider.select((state) => state?.currentGroupName),
    );
    final group = groups.getGroup(currentGroupName ?? '') ??
        (groups.isEmpty ? null : groups.first);
    if (group == null) {
      return NullStatus(label: context.appLocalizations.noData);
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
                    color: selected ? brandPrimary : context.colorScheme.outline,
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
