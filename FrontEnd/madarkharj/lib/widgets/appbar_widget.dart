import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: IconButton.filled(
        focusColor: const Color.fromARGB(255, 185, 185, 185),
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromRGBO(209, 209, 209, 1),
        ),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      titleSpacing: 30,
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(title),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
