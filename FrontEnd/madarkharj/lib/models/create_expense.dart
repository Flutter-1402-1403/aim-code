class AddExpenseModel {
  final int price;
  final String name;
  final int owner;
  List<int> users;

  AddExpenseModel({required this.price, required this.name,required this.owner, required this.users});

  Map<String, dynamic> toJson() {
    return {'price': price, 'name': name, 'users': users};
  }
}
