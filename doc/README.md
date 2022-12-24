# WidgetTest

## 最初のテスト
テキストが一致しているかチェックするテストコード

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/login_screen.dart';

void main() {
  testWidgets('Should have a title', (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder title = find.text("Login");

    // Assert
    expect(title, findsOneWidget);
  });
}
```

テストコードと比較するWidget
lib/login_screen.dart
```dart
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
    );
  }
}
```