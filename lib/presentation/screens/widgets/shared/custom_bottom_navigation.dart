import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/perfil':
        return 1;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: getCurrentIndex(context),
        onTap: (value) => onItemTapped(context, value),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Perfil'
          )
        ]
    );
  }
}
