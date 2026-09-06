import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final traffic = ref.watch(
      trafficsProvider.select((state) => state.list.safeLast(const Traffic())),
    );
    return CommonScaffold(
      title: appLocalizations.dashboard,
      actions: [
        Text(
          traffic.speedText,
          style: context.textTheme.labelMedium?.toLight,
        ),
        const SizedBox(width: 12),
      ],
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CircularStartButton(),
            SizedBox(height: 40),
            _ModeRow(),
          ],
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
    final foreground = isStart
        ? Colors.white
        : context.colorScheme.onSurface;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        ref.read(commonActionProvider.notifier).toggleRunning();
      },
      child: Container(
        width: 168,
        height: 168,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isStart
              ? brandPrimary
              : context.colorScheme.surfaceContainer,
          border: isStart ? null : Border.all(color: context.colorScheme.outline),
          boxShadow: isStart
              ? [
                  BoxShadow(
                    color: brandPrimary.withValues(alpha: 0.35),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isStart ? Icons.pause : Icons.power_settings_new,
              size: 56,
              color: foreground,
            ),
            const SizedBox(height: 12),
            Text(
              isStart ? appLocalizations.stopVpn : appLocalizations.startVpn,
              style: context.textTheme.titleMedium?.copyWith(
                color: foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeRow extends ConsumerWidget {
  const _ModeRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(
      patchClashConfigProvider.select((state) => state.mode),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in Mode.values)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: item == mode
                ? ShadButton(
                    backgroundColor: brandPrimary,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      globalState.container
                          .read(setupActionProvider.notifier)
                          .changeMode(item);
                    },
                    child: Text(Intl.message(item.name)),
                  )
                : ShadButton.outline(
                    onPressed: () {
                      globalState.container
                          .read(setupActionProvider.notifier)
                          .changeMode(item);
                    },
                    child: Text(Intl.message(item.name)),
                  ),
          ),
      ],
    );
  }
}
