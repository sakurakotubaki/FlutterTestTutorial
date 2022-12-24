class Validator {
  // メールアドレスのテスト関数
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

  // パスワードのテスト関数
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Required Field";
    }

    if (password.length < 8) {
      return "Please enter atleast 8 charater for password";
    }
  }
}
