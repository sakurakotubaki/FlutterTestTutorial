# UnitTest

## 最初のテスト
returnと一致してるので、テストが通る!

lib/validator.dart
```dart
class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Required Field";
    }
  }
}
```

test/validator_test.dart
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/validator.dart';

void main() {
  test('validate for empty email id', () {
    // Arrange & Act
    var result = Validator.validateEmail('');

    // Assert
    expect(result, "Required Field");
  });
}
```

## 正規表でメールアドレスのテスト

```dart
class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Required Field";
    }
    // 正規表現のテスト
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);
    // 等しくなかればエラー!
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email id";
    }
  }
}
```

テスト実行するコード

```dart
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
}
```

## GithubにTagをpushする方法

操作はブランチと一緒で、タグ名ごとに個別に
```
$ git push origin TAGNAME (TAGNAME は任意のタグ名)
```

もしくは、全部一気に
```
$ git push origin --tags
```
で反映できます。

また、タグのリモートからの削除もブランチと同様に
```
$ git tag -d TAGNAME  
$ git push origin :TAGNAME
```

もしくは、
```
$ git push --delete origin TAGNAME
```
で削除。

tag一覧を確認するコマンド
```
$ git tag
```