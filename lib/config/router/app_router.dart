import 'package:app_with_riverpod/presentation/screens/perfil/perfil_screen.dart';
import 'package:app_with_riverpod/presentation/views/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_with_riverpod/presentation/screens/screens.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigator,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigator,
            builder: (context, state, child) {
              return HomeScreen(childView: child,);
            },
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) {
                  return HomeView();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigator,
                    path: 'muro',
                    name: 'muro',
                    builder: (context, state) => const MuroScreen(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigator,
                        path: 'ladrillo',
                        name: 'ladrillo',
                        builder: (context, state) => const LadrilloScreen(),
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigator,
                            path: 'ladrillo1',
                            name: 'ladrillo1',
                            builder: (context, state) => const DatosLadrilloScreen(),
                            routes: [
                              GoRoute(
                                parentNavigatorKey: _rootNavigator,
                                path: 'ladrillo-results',
                                name: 'ladrillo_results',
                                builder: (context, state) => ResultLadrilloScreen(),
                              )
                            ]
                          )
                        ]
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigator,
                        path: 'bloqueta',
                        name: 'bloqueta',
                        builder: (context, state) => const BloquetaScreen(),
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigator,
                            path: 'bloqueta1',
                            name: 'bloqueta1',
                            builder: (context, state) => const DatosBloquetaScreen(),
                            routes: [
                              GoRoute(
                                parentNavigatorKey: _rootNavigator,
                                path: 'bloqueta-results',
                                name: 'bloqueta_results',
                                builder: (context, state) => const ResultLadrilloScreen(),
                              )
                            ]
                          )
                        ]
                      ),
                    ]
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigator,
                    path: 'columna',
                    name: 'columna',
                    builder: (context, state) => const ColumnaScreen(),
                    routes: [
                      
                    ]
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigator,
                    path: 'pisos',
                    name: 'pisos',
                    builder: (context, state) => const PisosScreen(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigator,
                        path: 'falso-piso',
                        name: 'falso-piso',
                        builder: (context, state) => const DatosPisosScreen(),
                        routes: [
                        ]
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigator,
                        path: 'contrapiso',
                        name: 'contrapiso',
                        builder: (context, state) => const DatosPisosScreen(),
                        routes: [
                        ]
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigator,
                        path: 'pisos_results',
                        name: 'pisos_results',
                        builder: (context, state) => const ResultPisosScreen(),
                      )
                    ]
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigator,
                    path: 'losas',
                    name: 'losas',
                    builder: (context, state) => const ColumnaScreen(),
                    routes: [

                    ]
                  )
                ]
              ),
              GoRoute(
                path: '/perfil',
                builder: (context, state) => const PerfilScreen(),
              ),
            ]
        ),
      ]
  );
}


