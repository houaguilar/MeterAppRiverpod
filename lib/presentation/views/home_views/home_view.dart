import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreenView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class _HomeScreenView extends ConsumerWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //  final todos = ref.watch(todosProvider);

    return ListView(
      children: const [

        _CustomListTile(
            title: 'Muro',
            subTitle: 'Un provider de sólo lectura',
            location: 'muro'),

        _CustomListTile(
            title: 'Columna',
            subTitle: 'Un uso aplicado',
            location: 'columna'),

        _CustomListTile(
            title: 'Pisos',
            subTitle: 'Un estado para almacenar un objeto',
            location: 'pisos'),

        _CustomListTile(
            title: 'Concreto en losas',
            subTitle: 'TODO - Una mezcla entre providers',
            location: 'losas'),
      ],
    );
  }
}

class _CustomListTile extends ConsumerWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {
          //    ref.read(todosProvider).clear();
          context.pushNamed(location);
        }
    );
  }
}