import 'package:fl_clash/common/common.dart';
import 'package:test/test.dart';

void main() {
  test('shouldHideProxyName matches configured patterns', () {
    expect(shouldHideProxyName('自动选择'), isTrue);
    expect(shouldHideProxyName('♻️ 自动选择'), isTrue);
    expect(shouldHideProxyName('故障转移'), isTrue);
    expect(shouldHideProxyName('剩余流量：1.00 GB'), isTrue);
    expect(shouldHideProxyName('套餐到期：2026-10-01'), isTrue);
    expect(shouldHideProxyName('香港 01'), isFalse);
    expect(shouldHideProxyName('日本 原生'), isFalse);
  });
}
