import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  const CustomAppBar({required this.title, required this.backButton, super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      leading: backButton?IconButton.filled(
        focusColor: const Color.fromARGB(255, 185, 185, 185),
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 148, 148, 148),
        ),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ):null,
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
