import 'dart:io';
import 'dart:math';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/config.dart';
import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

const windowsWindowAspectRatio = 4 / 3;
const preferredWindowsWindowSize = Size(960, 720);

Size responsiveWindowsWindowSize(Size availableSize) {
  if (availableSize.isEmpty) {
    return preferredWindowsWindowSize;
  }
  final width = min(
    preferredWindowsWindowSize.width,
    min(
      availableSize.width * 0.9,
      availableSize.height * 0.82 * windowsWindowAspectRatio,
    ),
  );
  return Size(width, width / windowsWindowAspectRatio);
}

class Window {
  static Window? _instance;

  Window._internal();

  factory Window() {
    _instance ??= Window._internal();
    return _instance!;
  }

  Future<void> init(int version, WindowProps props) async {
    final acquire = await singleInstanceLock.acquire();
    if (!acquire) {
      exit(0);
    }
    if (system.isWindows) {
      protocol.register('clash');
      protocol.register('clashmeta');
      protocol.register('flclash');
    }
    await windowManager.ensureInitialized();
    final isFixedWindowsWindow = system.isWindows;
    final windowSize = isFixedWindowsWindow
        ? await _getWindowsWindowSize()
        : props.size;
    final WindowOptions windowOptions = WindowOptions(
      size: windowSize,
      minimumSize: isFixedWindowsWindow ? windowSize : const Size(380, 400),
      maximumSize: isFixedWindowsWindow ? windowSize : null,
      title: appName,
    );
    if (!system.isMacOS || version > 10) {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    }
    await windowManager.setMaximizable(!isFixedWindowsWindow);
    if (isFixedWindowsWindow) {
      await windowManager.setResizable(true);
    }
    await _windowPosition(props, windowSize);
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setPreventClose(true);
    });
  }

  Future<Size> _getWindowsWindowSize() async {
    try {
      final display = await screenRetriever.getPrimaryDisplay();
      return responsiveWindowsWindowSize(display.visibleSize ?? display.size);
    } catch (_) {
      return preferredWindowsWindowSize;
    }
  }

  Future<void> _windowPosition(WindowProps props, Size windowSize) async {
    if (!system.isMacOS) {
      final left = props.left ?? 0;
      final top = props.top ?? 0;
      final right = left + windowSize.width;
      final bottom = top + windowSize.height;
      if (left == 0 && top == 0) {
        await windowManager.setAlignment(Alignment.center);
      } else {
        final displays = await screenRetriever.getAllDisplays();
        final isPositionValid = displays.any((display) {
          final displayPosition = display.visiblePosition ?? Offset.zero;
          final displayBounds = Rect.fromLTWH(
            displayPosition.dx,
            displayPosition.dy,
            (display.visibleSize ?? display.size).width,
            (display.visibleSize ?? display.size).height,
          );
          return displayBounds.contains(Offset(left, top)) ||
              displayBounds.contains(Offset(right, bottom));
        });
        if (isPositionValid) {
          await windowManager.setPosition(Offset(left, top));
        }
      }
    }
  }

  Future<void> show() async {
    render?.resume();
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setSkipTaskbar(false);
  }

  Future<bool> get isVisible async {
    final value = await windowManager.isVisible();
    commonPrint.log('window visible check: $value');
    return value;
  }

  Future<void> close() async {
    await windowManager.close();
  }

  void forceExit() {
    exit(0);
  }

  Future<void> hide() async {
    render?.pause();
    await windowManager.hide();
    await windowManager.setSkipTaskbar(true);
  }
}

final window = system.isDesktop ? Window() : null;
