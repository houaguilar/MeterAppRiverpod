import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.titleAppBar,
  });
  final String titleAppBar;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.goNamed('home');
            },
            child: const Text("Salir", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ),
        const SizedBox(width: 15,)
      ],
      title: Text(titleAppBar),
    );
  }
}