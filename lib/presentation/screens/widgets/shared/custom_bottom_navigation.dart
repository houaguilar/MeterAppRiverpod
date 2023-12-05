import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/lista':
        return 1;
      case '/mapa':
        return 2;
      case '/perfil':
        return 3;
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
        context.go('/lista');
        break;
      case 2:
        context.go('/mapa');
        break;
      case 3:
        context.go('/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: getCurrentIndex(context),
        selectedItemColor: Colors.green,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 26),
        onTap: (value) => onItemTapped(context, value),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded,),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_rounded),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: ''
          )
        ]
    );
  }
}
