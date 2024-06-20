import 'package:get/get.dart';
import 'package:madarkharj/models/user_data.dart';

class UserController extends GetxController {
  var user = User(id: 0, username: "username", firstName: "firstName", lastName: "lastName", dept: 0, demand: 0).obs;

  void setUser(User newUser) {
    user.value = newUser;
  }

  void clearUser() {
    user.value = User(id: 0, username: "username", firstName: "firstName", lastName: "lastName", dept: 0, demand: 0);
  }
}