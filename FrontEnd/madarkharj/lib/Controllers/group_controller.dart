import 'package:get/get.dart';
import 'package:madarkharj/models/groups_data.dart';
import 'package:madarkharj/services/group_info.dart';

class GroupController extends GetxController {
  var isLoading = true.obs;
  var groupdata = <Group>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      GroupInfo.getGroupsInfo().then((group) => {
            if (group.isNotEmpty) {groupdata.assignAll(group)}
          });
    } finally {
      isLoading(false);
    }
  }

  void reloadUsers() {
    fetchUsers();
  }
}
