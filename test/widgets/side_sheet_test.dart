import 'dart:ui';

import 'package:fl_clash/widgets/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SideSheet applies defaults and custom presentation values', (
    tester,
  ) async {
    final controller = SideSheet.createAnimationController(tester);
    addTearDown(controller.dispose);
    var closed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SideSheet(
            animationController: controller,
            onClosing: () {
              closed = true;
            },
            enableDrag: false,
            showDragHandle: true,
            backgroundColor: Colors.red,
            shadowColor: Colors.blue,
            elevation: 4,
            shape: const RoundedRectangleBorder(),
            clipBehavior: Clip.hardEdge,
            constraints: const BoxConstraints(minWidth: 240, maxWidth: 240),
            builder: (_) => const Text('Content'),
          ),
        ),
      ),
    );

    final material = tester.widget<Material>(
      find
          .ancestor(of: find.text('Content'), matching: find.byType(Material))
          .first,
    );
    expect(material.color, Colors.red);
    expect(material.shadowColor, Colors.blue);
    expect(material.elevation, 4);
    expect(tester.getSize(find.byType(SideSheet)).width, 240);
    expect(controller.duration, const Duration(milliseconds: 300));
    expect(controller.reverseDuration, const Duration(milliseconds: 200));
    expect(closed, isFalse);
  });

  testWidgets(
    'modal side sheet animates, returns a value, and uses a barrier',
    (tester) async {
      String? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return FilledButton(
                  onPressed: () async {
                    result = await showModalSideSheet<String>(
                      context: context,
                      useSafeArea: true,
                      isScrollControlled: true,
                      barrierColor: Colors.black45,
                      backgroundColor: Colors.green,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(),
                      clipBehavior: Clip.antiAlias,
                      constraints: const BoxConstraints(maxWidth: 280),
                      routeSettings: const RouteSettings(name: 'side-sheet'),
                      anchorPoint: Offset.zero,
                      builder: (context) {
                        return SizedBox(
                          width: 280,
                          child: TextButton(
                            onPressed: () => Navigator.pop(context, 'done'),
                            child: const Text('Close sheet'),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Open sheet'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open sheet'));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(SideSheet), findsOneWidget);
      expect(find.byType(AnimatedModalBarrier), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Close sheet'));
      await tester.pumpAndSettle();

      expect(result, 'done');
      expect(find.byType(SideSheet), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'transparent modal side sheet uses supplied controller and dismisses',
    (tester) async {
      final controller = AnimationController(
        vsync: tester,
        duration: const Duration(milliseconds: 20),
        reverseDuration: const Duration(milliseconds: 20),
      );
      addTearDown(controller.dispose);
      var completed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(platform: TargetPlatform.iOS),
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return FilledButton(
                  onPressed: () async {
                    await showModalSideSheet<void>(
                      context: context,
                      barrierColor: Colors.transparent,
                      transitionAnimationController: controller,
                      builder: (_) =>
                          const SizedBox(width: 200, child: Text('Dismiss me')),
                    );
                    completed = true;
                  },
                  child: const Text('Open transparent'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open transparent'));
      await tester.pumpAndSettle();
      expect(find.byType(ModalBarrier), findsWidgets);

      await tester.tapAt(const Offset(20, 300));
      await tester.pumpAndSettle();

      expect(completed, isTrue);
      expect(find.text('Dismiss me'), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('modal side sheet honors its desktop top inset', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return FilledButton(
                onPressed: () {
                  showModalSideSheet<void>(
                    context: context,
                    topInset: 56,
                    builder: (_) =>
                        const SizedBox(width: 200, child: Text('Inset sheet')),
                  );
                },
                child: const Text('Open inset sheet'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open inset sheet'));
    await tester.pumpAndSettle();

    expect(
      tester.getTopLeft(find.text('Inset sheet')).dy,
      greaterThanOrEqualTo(56),
    );
  });

  testWidgets('modal side sheet keeps the desktop toolbar outside its blur', (
    tester,
  ) async {
    var headerTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        builder: (_, child) {
          return Stack(
            children: [
              child!,
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: kToolbarHeight,
                child: GestureDetector(
                  key: const Key('desktop-window-header'),
                  onTap: () {
                    headerTapped = true;
                  },
                  child: const ColoredBox(color: Colors.transparent),
                ),
              ),
            ],
          );
        },
        home: Scaffold(
          appBar: AppBar(title: const Text('Dashboard')),
          body: Builder(
            builder: (context) {
              return FilledButton(
                onPressed: () {
                  showModalSideSheet<void>(
                    context: context,
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    topInset: kToolbarHeight,
                    builder: (_) => const SizedBox(
                      width: 200,
                      child: Text('Blurred sheet'),
                    ),
                  );
                },
                child: const Text('Open blurred sheet'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open blurred sheet'));
    await tester.pumpAndSettle();

    final filter = find.byType(BackdropFilter);
    final barrier = find.byType(AnimatedModalBarrier);
    expect(filter, findsOneWidget);
    expect(barrier, findsOneWidget);
    expect(tester.getTopLeft(filter).dy, kToolbarHeight);
    expect(tester.getTopLeft(barrier).dy, kToolbarHeight);
    expect(
      tester.getSize(filter).height,
      tester.view.physicalSize.height / tester.view.devicePixelRatio -
          kToolbarHeight,
    );

    await tester.tap(find.byKey(const Key('desktop-window-header')));
    await tester.pump();

    expect(headerTapped, isTrue);
    expect(tester.takeException(), isNull);
  });
}
