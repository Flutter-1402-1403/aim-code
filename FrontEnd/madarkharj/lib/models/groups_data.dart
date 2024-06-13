import 'dart:convert';

List<Group> groupFromJson(data) {
  return  List<Group>.from(data.map((x) => Group.fromJson(x)));
}

String groupToJson(List<Group> data) {
  final dyn =  List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Group {
  int id;
  String name;
  String description;
  List<int> users;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.users,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        users: List<int>.from(json["users"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "users": List<dynamic>.from(users.map((x) => x)),
      };
}
