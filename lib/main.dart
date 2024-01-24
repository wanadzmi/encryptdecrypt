import 'dart:developer';
import 'package:encrypt/encrypt.dart' as crypto_x;

void main() {
  const key = "aM3e0E1r1xEocsXZ";
  const plainText = "lorem ipsum example example";
  crypto_x.Encrypted encrypted = encrypt(key, plainText);
  String decryptedText = decrypt(key, encrypted);
  log(plainText);
  log(encrypted.base64);
  log("decrypting..");
  log(decryptedText);
}

String decrypt(String keyString, crypto_x.Encrypted encryptedData) {
  final key = crypto_x.Key.fromUtf8(keyString);
  final encrypter =
      crypto_x.Encrypter(crypto_x.AES(key, mode: crypto_x.AESMode.cbc));
  final initVector = crypto_x.IV.fromUtf8('ApXwrCda1lQAUDXP');
  return encrypter.decrypt(encryptedData, iv: initVector);
}

crypto_x.Encrypted encrypt(String keyString, String plainText) {
  final key = crypto_x.Key.fromUtf8(keyString);
  final encrypter =
      crypto_x.Encrypter(crypto_x.AES(key, mode: crypto_x.AESMode.cbc));
  final initVector = crypto_x.IV.fromUtf8('ApXwrCda1lQAUDXP');
  crypto_x.Encrypted encryptedData =
      encrypter.encrypt(plainText, iv: initVector);
  return encryptedData;
}
