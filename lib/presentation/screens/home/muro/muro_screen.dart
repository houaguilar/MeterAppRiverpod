import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuroScreen extends StatelessWidget {
  const MuroScreen({super.key});
  static const String route = 'muro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muro'),
      ),
      body: const _MuroView(),
    );
  }
}

class _MuroView extends StatelessWidget {
  const _MuroView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Que material usarás:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          MaterialButton(
            onPressed: () {
              context.pushNamed('ladrillo');
            },
            child: const Text('LADRILLO'),
          ),
          MaterialButton(
            onPressed: () {
              context.pushNamed('bloqueta');
            },
            child: const Text('BLOQUETA'),
          ),
        ],
      ),
    );
  }
}

