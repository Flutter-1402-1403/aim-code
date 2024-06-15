import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/create_group.dart';
import 'package:madarkharj/Pages/group.dart';
import 'package:madarkharj/models/groups_data.dart';
import 'package:madarkharj/services/group_info.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late List<Group> _groups;
  var _bottomNavIndex = 0;
  // AnimationController _animationController;
  // Animation<double> animation;
  // CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.person_rounded
  ];
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    GroupInfo.getGroupsInfo().then((groups) => {
          setState(() {
            _groups = groups;
            _isLoading = false;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
        titleSpacing: 30,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "گروه ها",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 6, 157, 36),
        child: const Icon(Icons.add_rounded, size: 45, color: Colors.white),
        onPressed: () {
          Get.to(()=> const CreateGroupPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: const Color.fromARGB(255, 6, 157, 36),
        height: Get.height / 13,
        backgroundColor: Colors.white,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        icons: iconList,
        activeIndex: 0,
        iconSize: 32,
        onTap: (int) {
          print(int);
        },
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
            ))
          : _groups.isEmpty
              ? const Center(
                  child: Text(
                    '!شما فعلا گروهی ندارید',
                    style: TextStyle(
                        fontSize: 23, color: Color.fromARGB(255, 6, 157, 36)),
                  ),
                )
              : ListView.builder(
                  itemCount: _groups.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () => {
                              Get.to(() => const GroupPage(),
                                  arguments: _groups[index].id)
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 24.0,
                              child: Icon(Icons.group_rounded,
                                  color: Colors.white, size: 32.0),
                            ),
                            title: Text(
                              _groups[index].name,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Peyda',
                                fontSize: 22,
                              ),
                            ),
                            subtitle: Text(
                              'تعداد اعضا: ${_groups[index].users.length} نفر',
                              style: const TextStyle(
                                  fontFamily: 'Peyda', fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
