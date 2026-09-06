import 'package:fl_clash/common/common.dart';
import 'package:test/test.dart';

void main() {
  const key = '4c6f8e5f9467dc71';

  test('aesCbcEncryptBase64 matches reference vectors', () {
    expect(
      aesCbcEncryptBase64('/user/info', key, '0000000000000000'),
      'a+jYQNJ9JnPXswrvCa+Qng==',
    );
    expect(
      aesCbcEncryptBase64(
        '/sub/api/v1/client/subscribe?token=abc123',
        key,
        'a1b2c3d4e5f60718',
      ),
      'xW5OxR7jtYXpBhUhmh36OKfqnfMU2PRcfCv5OoGGtB1lfdXD3lXyuPqjrd+ykKCP',
    );
    expect(
      aesCbcEncryptBase64(
        '/user/order/check?trade_no=20260906001',
        key,
        '0123456789abcdef',
      ),
      'dnEF8DpmWK28p0K+sZ/Uf3ZuIv/i2zZ2cP6bAvkOouBpU4oDC2eANGgSW7Gx5yAD',
    );
  });

  test('encryptPathPayload wraps cipher text in base64', () {
    expect(
      encryptPathPayload('/user/info', key, '0000000000000000'),
      'YStqWVFOSjlKblBYc3dydkNhK1FuZz09',
    );
  });

  test('randomIvHex returns 16 lowercase hex chars', () {
    final iv = randomIvHex();
    expect(iv, matches(RegExp(r'^[0-9a-f]{16}$')));
  });
}
