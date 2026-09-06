import 'package:fl_clash/views/panel/shop.dart';
import 'package:test/test.dart';

void main() {
  test('parsePlanContent handles json feature objects', () {
    final features = parsePlanContent(
      '[{"feature": "流量: 100GB/月", "support": true}, '
      '{"feature": "速率: 1Gbps", "support": false}]',
    );
    expect(features, hasLength(2));
    expect(features[0].text, '流量: 100GB/月');
    expect(features[0].support, isTrue);
    expect(features[1].text, '速率: 1Gbps');
    expect(features[1].support, isFalse);
  });

  test('parsePlanContent handles plain string arrays', () {
    final features = parsePlanContent('["内容1", "内容2"]');
    expect(features, hasLength(2));
    expect(features[0].text, '内容1');
    expect(features[0].support, isTrue);
  });

  test('parsePlanContent falls back to raw text', () {
    final features = parsePlanContent('普通文本内容');
    expect(features, hasLength(1));
    expect(features.single.text, '普通文本内容');
  });

  test('parsePlanContent handles empty and invalid content', () {
    expect(parsePlanContent(null), isEmpty);
    expect(parsePlanContent(''), isEmpty);
    expect(parsePlanContent('not json at all ['), hasLength(1));
  });
}
