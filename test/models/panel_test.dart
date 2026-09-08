import 'dart:convert';

import 'package:fl_clash/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PanelSubscribeInfo round-trips through json', () {
    const info = PanelSubscribeInfo(
      subscribeUrl: 'https://panel.example/api/v1/client/subscribe?token=abc',
      u: 100,
      d: 200,
      transferEnable: 1000,
      expiredAt: 1900000000,
      plan: PanelPlan(id: 1, name: 'Test', transferEnable: 1000),
    );

    final decoded = PanelSubscribeInfo.fromJson(
      jsonDecode(jsonEncode(info.toJson())) as Map<String, Object?>,
    );

    expect(decoded.subscribeUrl, info.subscribeUrl);
    expect(decoded.u, 100);
    expect(decoded.d, 200);
    expect(decoded.transferEnable, 1000);
    expect(decoded.expiredAt, 1900000000);
    expect(decoded.plan?.id, 1);
    expect(decoded.plan?.name, 'Test');
  });

  test('PanelUserInfo round-trips through json', () {
    const info = PanelUserInfo(
      id: 1,
      email: 'a@b.com',
      u: 1,
      d: 2,
      transferEnable: 100,
      expiredAt: 1900000000,
      balance: 50,
      plan: PanelPlan(name: 'Test'),
    );

    final decoded = PanelUserInfo.fromJson(
      jsonDecode(jsonEncode(info.toJson())) as Map<String, Object?>,
    );

    expect(decoded.id, 1);
    expect(decoded.email, 'a@b.com');
    expect(decoded.balance, 50);
    expect(decoded.plan?.name, 'Test');
  });

  test('PanelPlan keeps renewal prices and availability', () {
    const plan = PanelPlan(
      id: 1,
      name: 'Test',
      monthPrice: 1000,
      yearPrice: 10000,
      onetimePrice: 12000,
      renew: 1,
    );

    final decoded = PanelPlan.fromJson(
      jsonDecode(jsonEncode(plan.toJson())) as Map<String, Object?>,
    );

    expect(decoded.monthPrice, 1000);
    expect(decoded.yearPrice, 10000);
    expect(decoded.onetimePrice, 12000);
    expect(decoded.renew, 1);
  });
}
