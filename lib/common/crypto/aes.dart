import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

String randomIvHex() {
  final random = Random.secure();
  return List.generate(
    8,
    (_) => random.nextInt(256).toRadixString(16).padLeft(2, '0'),
  ).join();
}

String aesCbcEncryptBase64(String plaintext, String keyHex, String ivHex) {
  final data = Uint8List.fromList(utf8.encode(plaintext));
  final key = Uint8List.fromList(utf8.encode(keyHex));
  final iv = Uint8List.fromList(utf8.encode(ivHex));
  final cipher = PaddedBlockCipherImpl(
    PKCS7Padding(),
    CBCBlockCipher(AESEngine()),
  );
  cipher.init(
    true,
    PaddedBlockCipherParameters(
      ParametersWithIV<KeyParameter>(KeyParameter(key), iv),
      null,
    ),
  );
  return base64.encode(cipher.process(data));
}

String encryptPathPayload(String plaintext, String keyHex, String ivHex) {
  return base64.encode(
    utf8.encode(aesCbcEncryptBase64(plaintext, keyHex, ivHex)),
  );
}
