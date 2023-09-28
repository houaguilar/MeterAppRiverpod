import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PisosScreen extends StatelessWidget {
  const PisosScreen({super.key});
  static const String route = 'pisos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pisos'),
      ),
      body: const _PisosView(),
    );
  }
}

class _PisosView extends StatelessWidget {
  const _PisosView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Que vas a construir ?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          MaterialButton(
            onPressed: () {
              context.pushNamed('falso-piso');
            },
            child: const Text('FALSO PISO'),
          ),
          MaterialButton(
            onPressed: () {
              context.pushNamed('contrapiso');
            },
            child: const Text('CONTRAPISO'),
          ),
        ],
      ),
    );
  }
}

