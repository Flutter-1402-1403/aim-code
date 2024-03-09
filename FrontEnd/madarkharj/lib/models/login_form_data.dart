class LoginFormData {
  final String username;
  final String password;

  LoginFormData({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}