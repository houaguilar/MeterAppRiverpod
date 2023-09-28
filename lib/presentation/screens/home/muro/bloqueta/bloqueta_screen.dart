import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BloquetaScreen extends StatelessWidget {
  const BloquetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloqueta'),
      ),
      body: _BloquetaScreenView(),
    );
  }
}

class _BloquetaScreenView extends StatelessWidget {
  const _BloquetaScreenView();

  @override
  Widget build(BuildContext context) {

    //  final todos = ref.watch(todosProvider);

    return ListView(
      children: const [

        _CustomListTile(
            title: 'P7',
            location: 'bloqueta1'),

        _CustomListTile(
            title: 'P10',
            location: 'bloqueta1'),

        _CustomListTile(
            title: 'P12',
            location: 'bloqueta1'),

      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: Image.asset('assets/images/perfil.png'),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {
          //    ref.read(todosProvider).clear();
          context.pushNamed(location);
        }
    );
  }
}
