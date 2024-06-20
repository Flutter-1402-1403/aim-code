class Payment {
    int id;
    String price;
    String name;
    int? owner;
    List<int> users;

    Payment({
        required this.id,
        required this.price,
        required this.name,
        required this.owner,
        required this.users,
    });

  static List<Payment> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Payment.fromJson(json)).toList();
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      price: json['price'],
      name: json['name'],
      owner: json['owner'],
      users: List<int>.from(json['users']),
    );
  }
}