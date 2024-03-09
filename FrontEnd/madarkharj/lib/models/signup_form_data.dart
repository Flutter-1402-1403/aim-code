class SignUpFormData {
  final String firstName;
  final String lastName;
  final String username;
  final String password;

  SignUpFormData({required this.firstName, required this.lastName, required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'password': password,
    };
  }
}