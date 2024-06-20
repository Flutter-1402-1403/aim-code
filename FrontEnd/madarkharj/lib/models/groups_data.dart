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
  List<dynamic> user;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.user,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        user: List<dynamic>.from(json["user"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "user": List<dynamic>.from(user.map((x) => x)),
      };
}
