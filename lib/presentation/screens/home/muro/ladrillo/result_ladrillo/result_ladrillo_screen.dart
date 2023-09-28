import 'package:app_with_riverpod/domain/domain.dart';
import 'package:app_with_riverpod/presentation/providers/bloqueta/bloqueta_providers.dart';
import 'package:app_with_riverpod/presentation/providers/ladrillo/ladrillo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResultLadrilloScreen extends StatelessWidget {
  const ResultLadrilloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: const _ResultLadrilloScreenView(),
    );
  }
}

class _ResultLadrilloScreenView extends ConsumerWidget {
  const _ResultLadrilloScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final listaLadrillo = ref.watch(ladrilloResultProvider);
    final listaBloqueta = ref.watch(bloquetaResultProvider);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: listaLadrillo.isNotEmpty ? listaLadrillo.length : listaBloqueta.isNotEmpty ? listaBloqueta.length : 0,
              itemBuilder: (context, index) {
                if (listaLadrillo.isNotEmpty) {
                  return _LadrilloContainer(listaLadrillo[index]);
                } else if (listaBloqueta.isNotEmpty){
                  return _BloquetaContainer(listaBloqueta[index]);
                }
              }
          ),
        ),
        MaterialButton(
          onPressed: () {
            context.goNamed('home');
          },
          child: const Text('Añadir partida'),
        ),
        const SizedBox(height: 100,)
      ],
    );
  }

}

class _BloquetaContainer extends ConsumerWidget {
  const _BloquetaContainer(this.results);

  final BloquetaModel results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return _buildLadrilloContainer(context, results);
  }

  Widget _buildLadrilloContainer(BuildContext context, BloquetaModel results) {

    double areaMuro() {
      return double.parse(results.largo) * double.parse(results.altura);
    }

    double cantidadLadrillos(){
      switch (results.tipoBloqueta) {
        case 'P7':
          return 39 * areaMuro();
        case 'P10':
          return 68 * areaMuro();
        case 'P12':
          return 29 * areaMuro();
        default:
          return 0;
      }
    }

    double cantidadArena() {
      switch (results.tipoBloqueta) {
        case 'P7':
          return 0.024 * areaMuro();
        case 'P10':
          return 0.054 * areaMuro();
        case 'P12':
          return 0.014 * areaMuro();
        default:
          return 0;
      }
    }

    double cantidadCemento() {
      switch (results.tipoBloqueta) {
        case 'P7':
          return 0.21 * areaMuro();
        case 'P10':
          return 0.48 * areaMuro();
        case 'P12':
          return 0.123 * areaMuro();
        default:
          return 0;
      }
    }

    String cantidadLadrillosToString = cantidadLadrillos().toStringAsFixed(2);
    String cantidadArenaToString = cantidadArena().toStringAsFixed(2);
    String cantidadCementoToString = cantidadCemento().ceilToDouble().toString();

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(results.description, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Container(child: contentDatos('Tipo de Material', results.tipoBloqueta, ''),),
          Container(child: contentDatos('Tipo de Asentado', results.tipoBloqueta, ''),),
          Container(child: contentDatos('Largo', results.largo, 'metros'),),
          Container(child: contentDatos('Altura', results.altura, 'metros'),),
          Container(child: contentResultados('', 'UNIDAD', 'CANTIDAD', 16, FontWeight.w500),),
          Container(child: contentResultados('ARENA GRUESA', 'm3', cantidadArenaToString, 14, FontWeight.normal),),
          Container(child: contentResultados('CEMENTO', 'bls', cantidadCementoToString, 14, FontWeight.normal),),
          Container(child: contentResultados('LADRILLO', 'und', cantidadLadrillosToString, 14, FontWeight.normal),),
        ],
      ),
    );
  }

  Widget contentDatos(String type, String dato, [String? metros]) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$type:'),
              Text('$dato $metros')
            ],
          )
        ],
      ),
    );
  }

  Widget contentResultados(
      String descripcion,
      String unidad,
      String cantidad,
      double sizeText,
      FontWeight weightText) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 115,
            child: Text(descripcion,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(unidad,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(cantidad,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class _LadrilloContainer extends ConsumerWidget {
  const _LadrilloContainer(this.results);

  final LadrilloModel results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return _buildLadrilloContainer(context, results);
  }

  Widget _buildLadrilloContainer(BuildContext context, LadrilloModel results) {

    double areaMuro() {
      return double.parse(results.largo) * double.parse(results.altura);
    }

    double cantidadLadrillos(){
      switch (results.tipoAsentado) {
        case 'soga':
          return 39 * areaMuro();
        case 'cabeza':
          return 68 * areaMuro();
        case 'canto':
          return 29 * areaMuro();
        default:
          return 0;
      }
    }

    double cantidadArena() {
      switch (results.tipoAsentado) {
        case 'soga':
          return 0.024 * areaMuro();
        case 'cabeza':
          return 0.054 * areaMuro();
        case 'canto':
          return 0.014 * areaMuro();
        default:
          return 0;
      }
    }

    double cantidadCemento() {
      switch (results.tipoAsentado) {
        case 'soga':
          return 0.21 * areaMuro();
        case 'cabeza':
          return 0.48 * areaMuro();
        case 'canto':
          return 0.123 * areaMuro();
        default:
          return 0;
      }
    }

    String cantidadLadrillosToString = cantidadLadrillos().toStringAsFixed(2);
    String cantidadArenaToString = cantidadArena().toStringAsFixed(2);
    String cantidadCementoToString = cantidadCemento().ceilToDouble().toString();

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.lightGreen)),
      child: Column(
        children: [
          Text(results.description, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Container(child: contentDatos('Tipo de Material', results.tipoLadrillo, ''),),
          Container(child: contentDatos('Tipo de Asentado', results.tipoAsentado, ''),),
          Container(child: contentDatos('Largo', results.largo, 'metros'),),
          Container(child: contentDatos('Altura', results.altura, 'metros'),),
          Container(child: contentResultados('', 'UNIDAD', 'CANTIDAD', 16, FontWeight.w500),),
          Container(child: contentResultados('ARENA GRUESA', 'm3', cantidadArenaToString, 14, FontWeight.normal),),
          Container(child: contentResultados('CEMENTO', 'bls', cantidadCementoToString, 14, FontWeight.normal),),
          Container(child: contentResultados('LADRILLO', 'und', cantidadLadrillosToString, 14, FontWeight.normal),),
        ],
      ),
    );
  }

  Widget contentDatos(String type, String dato, [String? metros]) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$type:'),
              Text('$dato $metros')
            ],
          )
        ],
      ),
    );
  }

  Widget contentResultados(
      String descripcion,
      String unidad,
      String cantidad,
      double sizeText,
      FontWeight weightText) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 115,
            child: Text(descripcion,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(unidad,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(cantidad,
              style: TextStyle(fontSize: sizeText, fontWeight: weightText),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
