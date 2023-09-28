import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LadrilloScreen extends StatelessWidget {
  const LadrilloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ladrillo'),
      ),
      body: _LadrilloScreenView(),
    );
  }
}

class _LadrilloScreenView extends StatelessWidget {
  const _LadrilloScreenView();

  @override
  Widget build(BuildContext context) {

    //  final todos = ref.watch(todosProvider);

    return ListView(
      children: const [

        _CustomListTile(
            title: 'Ladrillo 1',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 2',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 3',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 4',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 5',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 6',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 7',
            location: 'ladrillo1'),

        _CustomListTile(
            title: 'Ladrillo 8',
            location: 'ladrillo1'),
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
