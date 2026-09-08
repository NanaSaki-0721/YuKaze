import 'dart:ui';

import 'package:fl_clash/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('common dialog keeps the desktop toolbar outside its blur', (
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
          body: Builder(
            builder: (context) {
              return Center(
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      CommonDialogRoute<void>(
                        builder: (_) => const Center(child: Text('Dialog')),
                        barrierColor: Colors.black38,
                        barrierDismissible: true,
                        barrierLabel: 'Dismiss',
                        transitionDuration: const Duration(milliseconds: 150),
                        reverseTransitionDuration: const Duration(
                          milliseconds: 75,
                        ),
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        topInset: kToolbarHeight,
                      ),
                    );
                  },
                  child: const Text('Open dialog'),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open dialog'));
    await tester.pumpAndSettle();

    final filter = find.byType(BackdropFilter);
    final barrier = find.byType(AnimatedModalBarrier);
    expect(filter, findsOneWidget);
    expect(barrier, findsOneWidget);
    expect(tester.getTopLeft(filter).dy, kToolbarHeight);
    expect(tester.getTopLeft(barrier).dy, kToolbarHeight);

    await tester.tap(find.byKey(const Key('desktop-window-header')));
    await tester.pump();

    expect(headerTapped, isTrue);
    expect(tester.takeException(), isNull);
  });
}
