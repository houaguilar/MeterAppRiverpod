import 'package:app_with_riverpod/presentation/providers/bloqueta/bloqueta_providers.dart';
import 'package:app_with_riverpod/presentation/providers/ladrillo/ladrillo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import 'pdf_muro_screen.dart';

class PreviewScreen extends ConsumerWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ladrillos = ref.watch(ladrilloResultProvider);
    final bloquetas = ref.watch(bloquetaResultProvider);

    final arenaLadrillo = ref.watch(cantidadArenaLadrilloProvider);
    final cementoLadrillo = ref.watch(cantidadCementoLadrilloProvider);
    final cantidadLadrillo = ref.watch(cantidadLadrilloProvider);

    final arenaBloqueta = ref.watch(cantidadArenaBloquetaProvider);
    final cementoBloqueta = ref.watch(cantidadCementoBloquetaProvider);
    final cantidadBloqueta = ref.watch(cantidadBloquetaProvider);

    void _showSharedToast(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Document shared successfully'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        onShared: _showSharedToast,
        build: (context) => makePdfMuro(
            ladrillos,
            bloquetas,
            arenaLadrillo,
            cementoLadrillo,
            cantidadLadrillo,
            arenaBloqueta,
            cementoBloqueta,
            cantidadBloqueta
        ),
      ),
    );
  }
}
