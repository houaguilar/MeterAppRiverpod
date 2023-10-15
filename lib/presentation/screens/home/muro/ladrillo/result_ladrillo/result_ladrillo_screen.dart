import 'package:app_with_riverpod/domain/domain.dart';
import 'package:app_with_riverpod/presentation/providers/bloqueta/bloqueta_providers.dart';
import 'package:app_with_riverpod/presentation/providers/ladrillo/ladrillo_providers.dart';
import 'package:app_with_riverpod/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';


class ResultLadrilloScreen extends ConsumerWidget {
  const ResultLadrilloScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(ladrilloResultProvider.notifier).clearList();
        ref.read(bloquetaResultProvider.notifier).clearList();
        return true;
      },
      child: Scaffold(
        appBar: const AppBarWidget(titleAppBar: 'Resultados',),
        body: const _ResultLadrilloScreenView(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              tooltip: 'Compartir',
              onPressed: () async {
                   await Share.share(_shareContent(ref));
              },
              heroTag: "btnShare",
              label: const Text('Compartir'),
              icon: const Icon(Icons.ios_share_rounded),
            ),
            const SizedBox(height: 8,),
            FloatingActionButton.extended(
              tooltip: 'Es para guaradr',
              onPressed: () => _showToast(context),
              heroTag: "btnSave",
              label: const Text('Guardar'),
              icon: const Icon(Icons.add_box_rounded),
            ),
            const SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Se guardó exitosamente'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  String _shareContent(WidgetRef ref) {
    final listaLadrillo = ref.watch(ladrilloResultProvider);
    final listaBloqueta = ref.watch(bloquetaResultProvider);

    String cantidadPruebaLadToString = calcularCantidadMaterial(listaLadrillo, calcularLadrillos).toStringAsFixed(2);
    String cantidadPruebaAreToString = calcularCantidadMaterial(listaLadrillo, calcularArena).toStringAsFixed(2);
    String cantidadPruebaCemToString = calcularCantidadMaterial(listaLadrillo, calcularCemento).ceilToDouble().toString();

    String cantidadBloquetasToString = cantidadBloquetas(listaBloqueta).toStringAsFixed(2);
    String cantidadArenaToString = cantidadArena(listaBloqueta).toStringAsFixed(2);
    String cantidadCementoToString = cantidadCemento(listaBloqueta).ceilToDouble().toString();

    String datosMetrado = 'DATOS METRADO';
    String listaMateriales = 'LISTA DE MATERIALES';

    if (listaLadrillo.isNotEmpty) {
      final datosLadrillo = ref.watch(datosShareLadrilloProvider);
      final shareText = '$datosMetrado \n$datosLadrillo \n-------------\n$listaMateriales \n*Arena gruesa: $cantidadPruebaAreToString m3 \n*Cemento: $cantidadPruebaCemToString bls \n*Ladrillo: $cantidadPruebaLadToString und';
      return shareText;
    } else if (listaBloqueta.isNotEmpty) {
      final datosBloqueta = ref.watch(datosShareBloquetaProvider);
      final shareText = '$datosMetrado \n$datosBloqueta \n-------------\n$listaMateriales \n*Arena gruesa: $cantidadArenaToString m3 \n*Cemento: $cantidadCementoToString bls \n*Bloqueta: $cantidadBloquetasToString und';
      return shareText;
    } else {
      return 'Error';
    }
  }
}

class _ResultLadrilloScreenView extends ConsumerWidget {
  const _ResultLadrilloScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final listaLadrillo = ref.watch(ladrilloResultProvider);
    final listaBloqueta = ref.watch(bloquetaResultProvider);

    String cantidadPruebaLadToString = calcularCantidadMaterial(listaLadrillo, calcularLadrillos).toStringAsFixed(2);
    String cantidadPruebaAreToString = calcularCantidadMaterial(listaLadrillo, calcularArena).toStringAsFixed(2);
    String cantidadPruebaCemToString = calcularCantidadMaterial(listaLadrillo, calcularCemento).ceilToDouble().toString();

    String cantidadBloquetasToString = cantidadBloquetas(listaBloqueta).toStringAsFixed(2);
    String cantidadArenaToString = cantidadArena(listaBloqueta).toStringAsFixed(2);
    String cantidadCementoToString = cantidadCemento(listaBloqueta).ceilToDouble().toString();

    return Column(
      children: [
        Expanded(
          child: Container(
            child: listaLadrillo.isNotEmpty ? const _LadrilloContainer() : listaBloqueta.isNotEmpty ? const _BloquetaContainer() : null,
          ),
          /*child: ListView.builder(
              itemCount: listaLadrillo.isNotEmpty ? listaLadrillo.length : listaBloqueta.isNotEmpty ? listaBloqueta.length : 0,
              itemBuilder: (context, index) {
                if (listaLadrillo.isNotEmpty) {
                  return _LadrilloContainer(listaLadrillo[index]);
                } else if (listaBloqueta.isNotEmpty){
                  return _BloquetaContainer(listaBloqueta[index]);
                }
                return null;
              }
          ),*/
        ),
        MaterialButton(
          onPressed: () {
            ref.watch(cantidadArenaLadrilloProvider);
            ref.watch(cantidadCementoLadrilloProvider);
            ref.watch(cantidadLadrilloProvider);

            ref.watch(cantidadArenaBloquetaProvider);
            ref.watch(cantidadCementoBloquetaProvider);
            ref.watch(cantidadBloquetaProvider);

            if (listaLadrillo.isNotEmpty) {
              ref.read(cantidadArenaLadrilloProvider.notifier).arena(cantidadPruebaAreToString);
              ref.read(cantidadCementoLadrilloProvider.notifier).cemento(cantidadPruebaCemToString);
              ref.read(cantidadLadrilloProvider.notifier).ladrillo(cantidadPruebaLadToString);
              context.goNamed('ladrillo-pdf');
            } else {
              ref.read(cantidadArenaBloquetaProvider.notifier).arena(cantidadArenaToString);
              ref.read(cantidadCementoBloquetaProvider.notifier).cemento(cantidadCementoToString);
              ref.read(cantidadBloquetaProvider.notifier).bloqueta(cantidadBloquetasToString);
              context.goNamed('bloqueta-pdf');
            }
          },
          color: const Color(0x00ecf0f1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 50,
          minWidth: 200,
          child: const Text("Generar PDF",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold)
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}

class _BloquetaContainer extends ConsumerWidget {
  //const _BloquetaContainer(this.results);
  const _BloquetaContainer();
 // final BloquetaModel results;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(bloquetaResultProvider);

    return _buildBloquetaContainer(context, results);
    //return _buildLadrilloContainer(context, results);
  }
 // Widget _buildLadrilloContainer(BuildContext context, BloquetaModel results) {
  Widget _buildBloquetaContainer(BuildContext context, List<BloquetaModel> results) {

    double areaMuro(int index) {
      return double.parse(results[index].largo) * double.parse(results[index].altura);
    }

    String cantidadBloquetasToString = cantidadBloquetas(results).toStringAsFixed(2);
    String cantidadArenaToString = cantidadArena(results).toStringAsFixed(2);
    String cantidadCementoToString = cantidadCemento(results).ceilToDouble().toString();

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text('Datos del Metrado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const CommonContentResults(descripcion: '', unidad: 'UNIDAD', cantidad: 'CANTIDAD', sizeText: 16, weightText: FontWeight.w500),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CommonContentResults(descripcion: results[index].description, unidad: 'm2', cantidad: areaMuro(index).toString(), sizeText: 14, weightText: FontWeight.normal);
            },
            itemCount: results.length,
          ),
          const SizedBox(height: 20,),
          const Text('Lista de Materiales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const CommonContentResults(descripcion: '', unidad: 'UNIDAD', cantidad: 'CANTIDAD', sizeText: 16, weightText: FontWeight.w500),
          CommonContentResults(descripcion: 'ARENA GRUESA', unidad: 'm3', cantidad: cantidadArenaToString, sizeText: 14, weightText: FontWeight.normal),
          CommonContentResults(descripcion: 'CEMENTO', unidad: 'bls', cantidad: cantidadCementoToString, sizeText: 14, weightText: FontWeight.normal),
          CommonContentResults(descripcion: 'LADRILLO', unidad: 'und', cantidad: cantidadBloquetasToString, sizeText: 14, weightText: FontWeight.normal),
        ],
      ),
    );
  }
}

class _LadrilloContainer extends ConsumerWidget {
  const _LadrilloContainer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(ladrilloResultProvider);

    return _buildLadrilloContainer(context, results);
  }

  Widget _buildLadrilloContainer(BuildContext context, List<LadrilloModel> results) {

    double areaMuro(int index) {
      return double.parse(results[index].largo) * double.parse(results[index].altura);
    }

    String cantidadPruebaLadToString = calcularCantidadMaterial(results, calcularLadrillos).toStringAsFixed(2);
    String cantidadPruebaAreToString = calcularCantidadMaterial(results, calcularArena).toStringAsFixed(2);
    String cantidadPruebaCemToString = calcularCantidadMaterial(results, calcularCemento).ceilToDouble().toString();

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.lightGreen)),
      child: Column(
        children: [
          const Text('Datos del Metrado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const CommonContentResults(descripcion: '', unidad: 'UNIDAD', cantidad: 'CANTIDAD', sizeText: 16, weightText: FontWeight.w500,),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CommonContentResults(descripcion: results[index].description, unidad: 'm2', cantidad: areaMuro(index).toString(), sizeText: 14, weightText: FontWeight.normal,);
            },
            itemCount: results.length,
          ),
          const SizedBox(height: 20,),
          const Text('Lista de Materiales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const CommonContentResults(descripcion: '', unidad: 'UNIDAD', cantidad: 'CANTIDAD', sizeText: 16, weightText: FontWeight.w500,),
          CommonContentResults(descripcion: 'ARENA GRUESA', unidad: 'm3', cantidad: cantidadPruebaAreToString, sizeText: 14, weightText: FontWeight.normal,),
          CommonContentResults(descripcion: 'CEMENTO', unidad: 'bls', cantidad: cantidadPruebaCemToString, sizeText: 14, weightText: FontWeight.normal,),
          CommonContentResults(descripcion: 'LADRILLO', unidad: 'und', cantidad: cantidadPruebaLadToString, sizeText: 14, weightText: FontWeight.normal,),
        ],
      ),
    );
  }
}

double calcularCantidadMaterial(List<LadrilloModel> results, double Function(LadrilloModel) calcular) {
  return results.fold(0.0, (suma, ladrillo) => suma + calcular(ladrillo));
}

double calcularLadrillos(LadrilloModel ladrillo) {
  double largo = double.parse(ladrillo.largo);
  double altura = double.parse(ladrillo.altura);

  switch (ladrillo.tipoLadrillo) {
    case 'Pandereta':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 36 * (1 + 0.07), 30 * (1 + 0.07));
    case 'Kingkong':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 39 * (1 + 0.07), 29 * (1 + 0.07), 68 * (1 + 0.07));
    default:
      return 0;
  }
}

double calcularCemento(LadrilloModel ladrillo) {
  double largo = double.parse(ladrillo.largo);
  double altura = double.parse(ladrillo.altura);

  switch (ladrillo.tipoLadrillo) {
    case 'Pandereta':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 0.19, 0.15);
    case 'Kingkong':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 0.21, 0.123, 0.48);
    default:
      return 0;
  }
}

double calcularArena(LadrilloModel ladrillo) {
  double largo = double.parse(ladrillo.largo);
  double altura = double.parse(ladrillo.altura);

  switch (ladrillo.tipoLadrillo) {
    case 'Pandereta':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 0.021, 0.017);
    case 'Kingkong':
      return calcularAsentado(ladrillo.tipoAsentado, largo, altura, 0.024, 0.014, 0.054);
    default:
      return 0;
  }
}

double calcularAsentado(String tipoAsentado, double largo, double altura, double soga, double canto, [double cabeza = 0]) {
  switch (tipoAsentado) {
    case 'soga':
      return largo * altura * soga;
    case 'canto':
      return largo * altura * canto;
    case 'cabeza':
      return largo * altura * cabeza;
    default:
      return 0;
  }
}




double calcularCantidadBloquetas(String tipoBloqueta, double largo, double altura) {
  switch (tipoBloqueta) {
    case 'P7':
    case 'P10':
    case 'P12':
      return largo * altura * 8 * (1 + 0.07);
    default:
      return 0;
  }
}

double calcularCantidadArena(String tipoBloqueta, double largo, double altura) {
  switch (tipoBloqueta) {
    case 'P7':
      return largo * altura * 0.0059;
    case 'P10':
      return largo * altura * 0.0085;
    case 'P12':
      return largo * altura * 0.0102;
    default:
      return 0;
  }
}

double calcularCantidadCemento(String tipoBloqueta, double largo, double altura) {
  switch (tipoBloqueta) {
    case 'P7':
      return largo * altura * 0.052;
    case 'P10':
      return largo * altura * 0.075;
    case 'P12':
      return largo * altura * 0.0901;
    default:
      return 0;
  }
}

double cantidadBloquetas(List<BloquetaModel> results) {
  double sumaDeBloquetas = 0.0;
  for (BloquetaModel bloqueta in results) {
    double largo = double.parse(bloqueta.largo);
    double altura = double.parse(bloqueta.altura);
    sumaDeBloquetas += calcularCantidadBloquetas(bloqueta.tipoBloqueta, largo, altura);
  }
  return sumaDeBloquetas;
}

double cantidadArena(List<BloquetaModel> results) {
  double sumaDeArena = 0.0;
  for (BloquetaModel bloqueta in results) {
    double largo = double.parse(bloqueta.largo);
    double altura = double.parse(bloqueta.altura);
    sumaDeArena += calcularCantidadArena(bloqueta.tipoBloqueta, largo, altura);
  }
  return sumaDeArena;
}

double cantidadCemento(List<BloquetaModel> results) {
  double sumaDeCemento = 0.0;
  for (BloquetaModel bloqueta in results) {
    double largo = double.parse(bloqueta.largo);
    double altura = double.parse(bloqueta.altura);
    sumaDeCemento += calcularCantidadCemento(bloqueta.tipoBloqueta, largo, altura);
  }
  return sumaDeCemento;
}
