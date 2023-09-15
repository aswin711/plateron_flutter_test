import 'package:flutter/material.dart';

class AppTitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppTitleBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Colors.white
      ),),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
