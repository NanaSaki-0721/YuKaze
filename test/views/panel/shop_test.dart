import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/common/theme.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/panel.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/views/panel/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  test('renewal periods exclude one-time and traffic reset purchases', () {
    const plan = PanelPlan(
      monthPrice: 1000,
      yearPrice: 10000,
      onetimePrice: 12000,
      resetPrice: 2000,
    );

    expect(availableRenewalPeriodsForPlan(plan), ['year_price', 'month_price']);
  });

  testWidgets('desktop purchase button has a larger tap target', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final container = ProviderContainer(
      overrides: [plansProvider.overrideWith(_TestPlans.new)],
    );
    addTearDown(container.dispose);
    globalState.container = container;

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const _TestApp(child: ShopView()),
      ),
    );
    await tester.pumpAndSettle();

    final purchaseButton = find.widgetWithText(FilledButton, 'Buy');

    expect(purchaseButton, findsOneWidget);
    expect(tester.getSize(purchaseButton).width, greaterThanOrEqualTo(180));
    expect(tester.getSize(purchaseButton).height, greaterThanOrEqualTo(52));
    expect(tester.takeException(), null);
  });
}

class _TestPlans extends Plans {
  @override
  Future<List<PanelPlan>> build() async {
    return const [PanelPlan(id: 1, name: 'Test plan', monthPrice: 1000)];
  }
}

class _TestApp extends StatelessWidget {
  final Widget child;

  const _TestApp({required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalState.navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      builder: (context, child) {
        globalState.measure = Measure.of(context, 1);
        globalState.theme = CommonTheme.of(context, 1);
        return ShadTheme(
          data: shadThemeOfBrightness(Theme.of(context).brightness),
          child: child!,
        );
      },
      home: child,
    );
  }
}
