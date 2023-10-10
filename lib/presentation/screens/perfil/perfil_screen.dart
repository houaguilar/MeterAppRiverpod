import 'package:app_with_riverpod/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerfilScreen extends ConsumerWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarProfile(ref: ref,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GoPremium(),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('Que necesitas ?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget{
  const AppBarProfile({
    super.key,
    required this.ref
  });

  final WidgetRef ref;
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/perfil.png'),
            ),
          ),
          const SizedBox(width: 10),
          const Text('Hi, Jordy',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(darkModeProvider.notifier).toggleDarkMode();
          },
          icon: ref.watch(darkModeProvider)
              ? const Icon( Icons.light_mode_outlined, size: 40,)
              : const Icon( Icons.dark_mode_outlined, size: 40),
          padding: const EdgeInsets.only(right: 20),)
      ],
    );
  }
}
