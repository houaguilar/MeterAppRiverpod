import 'package:app_with_riverpod/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod App'),
      ),
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}