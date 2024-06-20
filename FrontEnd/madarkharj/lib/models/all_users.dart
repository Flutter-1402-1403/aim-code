class AllUser {
  int id;
  dynamic lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  AllUser({
    required this.id,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.groups,
    required this.userPermissions,
  });

  factory AllUser.fromJson(Map<String, dynamic> json) {
    return AllUser(
      id: json['id'],
      lastLogin: json['last_login'],
      isSuperuser: json['is_superuser'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: DateTime.parse(json['date_joined']),
      groups: List<dynamic>.from(json['groups']),
      userPermissions: List<dynamic>.from(json['user_permissions']),
    );
  }

  static List<AllUser> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AllUser.fromJson(json)).toList();
  }
}
