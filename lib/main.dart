import 'package:flutter/material.dart';
import 'package:app_with_riverpod/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_with_riverpod/presentation/providers/providers.dart';

void main() => runApp(
    ProviderScope(child: MyApp())
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appRouter = ref.watch(appRouterProvider);
    final isDarkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: isDarkMode ).getTheme(),
    );
  }
}