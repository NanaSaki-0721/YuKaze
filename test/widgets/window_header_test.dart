import 'package:fl_clash/manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const windowManagerChannel = MethodChannel('window_manager');

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(windowManagerChannel, null);
  });

  testWidgets('desktop caption buttons cover the full toolbar height', (
    tester,
  ) async {
    var minimized = false;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(windowManagerChannel, (call) async {
          if (call.method == 'isAlwaysOnTop') {
            return false;
          }
          if (call.method == 'minimize') {
            minimized = true;
          }
          return null;
        });

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(height: kToolbarHeight, child: WindowHeader()),
        ),
      ),
    );
    await tester.pump();

    final minimizeButton = find.byKey(const Key('window-minimize-button'));
    final closeButton = find.byKey(const Key('window-close-button'));

    expect(tester.getSize(minimizeButton), const Size(46, kToolbarHeight));
    expect(tester.getSize(closeButton), const Size(46, kToolbarHeight));
    expect(tester.getTopLeft(minimizeButton).dy, 0);
    expect(tester.getTopLeft(closeButton).dy, 0);

    final minimizeRect = tester.getRect(minimizeButton);
    await tester.tapAt(Offset(minimizeRect.center.dx, minimizeRect.top + 1));
    await tester.pump();

    expect(minimized, isTrue);
  });
}
