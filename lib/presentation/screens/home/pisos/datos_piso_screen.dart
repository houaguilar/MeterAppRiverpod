import 'package:app_with_riverpod/presentation/providers/pisos/pisos_providers.dart';
import 'package:app_with_riverpod/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class DatosPisosScreen extends ConsumerStatefulWidget {
  const DatosPisosScreen({Key? key}) : super(key: key);
  static const String route = 'pisos';

  @override
  ConsumerState<DatosPisosScreen> createState() => _DatosPisosScreenState();
}

class _DatosPisosScreenState extends ConsumerState<DatosPisosScreen> {

  late String description;
  late String largo;
  late String ancho;
  late String altura;

  final TextEditingController _descriptionController =  TextEditingController();
  final TextEditingController _largoController =  TextEditingController();
  final TextEditingController _anchoController = TextEditingController();
  final TextEditingController _alturaController =  TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.watch(pisosResultProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Datos',),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
          child: Icon(Icons.refresh),),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: const Text('Complete los siguientes campos: ',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: CommonTextFormField(
                        description: 'Descripción' ,controller: _descriptionController, hintText: 'ej. Muro de la cocina', maxWidth: 180, isKeyboardText: true,),),
                    SizedBox(
                      child: CommonTextFormField(
                        description: 'Largo' ,controller: _largoController, hintText: 'metros', maxWidth: 70,),),
                    SizedBox(
                      child: CommonTextFormField(
                        description: 'Ancho', controller: _anchoController, hintText: 'ancho', maxWidth: 70,),),
                    SizedBox(
                      child: CommonTextFormField(
                        description: 'Altura' ,controller: _alturaController, hintText: 'metros', maxWidth: 70,),),

                    //   SizedBox(child: Container(child: containTextFormField('longitud', 'longitud', 'metros'))),
                    //  SizedBox(child: Container(child: containTextFormField('altitud', 'altitud', 'metros'))),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text('Añadir piso'),
                        )
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  description = _descriptionController.text;
                  largo = _largoController.text;
                  altura = _alturaController.text;
                  ancho = _anchoController.text;
                  var datosPisos = ref.read(pisosResultProvider.notifier);
                  datosPisos.createPisos(description, description, largo, ancho, altura);
                  context.pushNamed('pisos_results');
                },
                child: const Text("Metrar",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)
                )
            ),
          ],
        ),
      ),
    );
  }
}
