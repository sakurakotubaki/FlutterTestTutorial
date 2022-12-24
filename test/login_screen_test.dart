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
  // メールアドレスのテスト
  testWidgets("Should have a one text field form to collection user email id",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder userNameTextField = find.byKey(const ValueKey("email_id"));

    // Assert
    expect(userNameTextField, findsOneWidget);
  });
  // パスワードのテスト
  testWidgets("Should have a one text field form to collection Password",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder passwordTextField = find.byKey(const ValueKey("password"));

    // Assert
    expect(passwordTextField, findsOneWidget);
  });
  // Loginボタンのテスト
  testWidgets("Should have login button", (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder loginButton = find.byType(ElevatedButton);

    // Assert
    expect(loginButton, findsOneWidget);
  });

  // error messageのテスト
  testWidgets(
      "Should show Required Fields error message if user email id & password is empty",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTests = find.text("Required Field");

    // Assert
    expect(errorTests, findsNWidgets(2));
  });

  testWidgets('Should submit form when user email id & password is valid',
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // ACT
    Finder userNameTextField = find.byKey(const ValueKey("email_id"));
    Finder pa = find.byKey(const ValueKey("email_id"));
    Finder passwordTextField = find.byKey(const ValueKey("password"));
    await tester.enterText(userNameTextField, "ficha@gmail.com");
    await tester.enterText(passwordTextField, "password");
    Finder errorTests = find.text("Required Field");

    // Assert
    expect(errorTests, findsNothing);
  });
}
