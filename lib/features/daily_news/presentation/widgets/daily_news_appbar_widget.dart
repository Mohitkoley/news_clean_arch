import 'package:flutter/material.dart';

class DailyNewsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DailyNewsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
