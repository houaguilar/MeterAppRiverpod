import 'package:app_with_riverpod/domain/domain.dart';
import 'package:app_with_riverpod/presentation/providers/ladrillo/ladrillo_providers.dart';
import 'package:app_with_riverpod/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LadrilloScreen extends StatelessWidget {
  const LadrilloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(titleAppBar: 'Ladrillo',),
      body: _LadrilloScreenView(),
    );
  }
}

class _LadrilloScreenView extends ConsumerWidget {
  const _LadrilloScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tipoLadrilloProvider);
    final data = TipoLadrilloModel.generateTipoLadrillo();

    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.asset(data[index].imageAsset),
            title: Text(data[index].title),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              ref.read(tipoLadrilloProvider.notifier).selectLadrillo(data[index].title);
              context.pushNamed(data[index].location);
            },
          ),
        );
      },
      itemCount: data.length,
    );
  }
}

class _CustomListTile extends ConsumerWidget {
  final String title;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              title: Text(title),
              leading: Image.asset('assets/images/perfil.png'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                ref.read(tipoLadrilloProvider.notifier).selectLadrillo(title);
                context.pushNamed(location);
              }
          ),
        );
      },
      itemCount: 8,
    );
  }
}
