import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/validator.dart';

void main() {
  // 成功するテスト
  test('validate for empty email id', () {
    // Arrange & Act
    var result = Validator.validateEmail('');

    // Assert
    expect(result, "Required Field");
  });

  // 正規表現のテスト
  test('validate for empty email id', () {
    // Arrange & Act
    var result = Validator.validateEmail('asjdnkjashd');

    // Assert
    expect(result, "Please enter a valid email id");
  });

  // 失敗するメールアドレスのテスト
  test('validate for empty email id', () {
    // Arrange & Act
    var result = Validator.validateEmail('abc@gmail.com');

    // Assert
    expect(result, null);
  });

  // 空のパスワードのテスト
  test('validate for empty password', () {
    // Arrange & Act
    var result = Validator.validatePassword('');

    // Assert
    expect(result, "Required Field");
  });

  // パスワードのテスト[文字数が8未満ならテストに通る]
  test('validate for invalid password', () {
    // Arrange & Act
    var result = Validator.validatePassword('pass');

    // Assert
    expect(result, "Please enter atleast 8 charater for password");
  });

  test('validate for invalid password', () {
    // Arrange & Act
    var result = Validator.validatePassword('password');

    // Assert
    expect(result, null);
  });
}
