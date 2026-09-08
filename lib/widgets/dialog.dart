import 'dart:math';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:fl_clash/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonDialog extends ConsumerWidget {
  final String title;
  final Widget? child;
  final List<Widget>? actions;
  final EdgeInsets? padding;
  final bool overrideScroll;
  final Color? backgroundColor;

  const CommonDialog({
    super.key,
    required this.title,
    this.actions,
    this.child,
    this.padding,
    this.overrideScroll = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, ref) {
    final size = ref.watch(viewSizeProvider);
    return AlertDialog(
      title: Text(title),
      actions: actions,
      contentPadding: padding,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
        constraints: BoxConstraints(
          maxHeight: min(size.height - 40, 500),
          maxWidth: 300,
        ),
        width: size.width - 40,
        child: !overrideScroll ? SingleChildScrollView(child: child) : child,
      ),
    );
  }
}

class CommonModal extends ConsumerWidget {
  final Widget? child;

  const CommonModal({super.key, this.child});

  @override
  Widget build(BuildContext context, ref) {
    final size = ref.watch(viewSizeProvider);
    return Center(
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.85,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}

class CommonDialogRoute<T> extends PopupRoute<T> {
  CommonDialogRoute({
    required this.builder,
    required this.barrierColor,
    required this.barrierDismissible,
    required this.barrierLabel,
    required this.transitionDuration,
    required this.reverseTransitionDuration,
    this.topInset = 0,
    ImageFilter? filter,
    super.settings,
  }) : assert(!barrierDismissible || barrierLabel != null),
       _barrierFilter = filter;

  final WidgetBuilder builder;

  @override
  final Color? barrierColor;

  @override
  final bool barrierDismissible;

  @override
  final String? barrierLabel;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  final double topInset;
  final ImageFilter? _barrierFilter;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final theme = Theme.of(context);
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: SafeArea(
        child: Builder(
          builder: (context) {
            return Theme(data: theme, child: builder(context));
          },
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeScaleTransition(animation: animation, child: child);
  }

  @override
  Widget buildModalBarrier() {
    final barrier = barrierColor != null && barrierColor!.a != 0 && !offstage
        ? AnimatedModalBarrier(
            color: animation!.drive(
              ColorTween(
                begin: barrierColor!.withValues(alpha: 0),
                end: barrierColor,
              ).chain(CurveTween(curve: barrierCurve)),
            ),
            dismissible: barrierDismissible,
            semanticsLabel: barrierLabel,
            barrierSemanticsDismissible: semanticsDismissible,
          )
        : ModalBarrier(
            dismissible: barrierDismissible,
            semanticsLabel: barrierLabel,
            barrierSemanticsDismissible: semanticsDismissible,
          );
    final filteredBarrier = _barrierFilter == null
        ? barrier
        : ClipRect(
            child: BackdropFilter(filter: _barrierFilter, child: barrier),
          );
    if (topInset == 0) {
      return filteredBarrier;
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: topInset,
          left: 0,
          right: 0,
          bottom: 0,
          child: filteredBarrier,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: topInset,
          child: const AbsorbPointer(child: SizedBox.expand()),
        ),
      ],
    );
  }
}
