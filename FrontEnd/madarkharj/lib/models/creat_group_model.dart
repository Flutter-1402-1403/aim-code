class CreateGroupModel {
  final String name;
  final String description;
  List<int> user;

  CreateGroupModel({ required this.name , required this.description , required this.user});

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'user': user};
  }
}
