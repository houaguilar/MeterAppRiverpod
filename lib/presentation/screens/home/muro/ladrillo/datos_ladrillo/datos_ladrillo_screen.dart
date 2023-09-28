import 'package:app_with_riverpod/presentation/providers/ladrillo/ladrillo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/widgets.dart';

class DatosLadrilloScreen extends ConsumerStatefulWidget {
  const DatosLadrilloScreen({Key? key}) : super(key: key);
  static const String route = 'detail';

  @override
  ConsumerState<DatosLadrilloScreen> createState() => _DatosLadrilloScreenState();
}

class _DatosLadrilloScreenState extends ConsumerState<DatosLadrilloScreen> {

  List<String> ladrillos = ["Kingkong", "Pandereta"];
  List<String> asentadosKingkong = ["soga","cabeza","canto"];
  List<String> asentadosPandereta = ["soga","canto"];

  late String description;
  late String ladrillo;
  late String asentado;
  late String largo;
  late String altura;

  String? selectedValueLadrillo;
  String? selectedValueAsentado;

  final textLongitudController = TextEditingController();
  final textAltitudController = TextEditingController();

  final TextEditingController _descriptionController =  TextEditingController();
  final TextEditingController _largoController =  TextEditingController();
  final TextEditingController _alturaController =  TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.watch(ladrilloResultProvider);

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
                      child: Container(
                          child: contentDropdownButton('ladrillo', 'Tipo de ladrillo', ladrillos)
                        //  child: ContentDropdownButton(type: 'ladrillo', description: 'Tipo de ladrillo', typeList: ladrillos, ladrillo: ladrillo,),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                          child: contentDropdownButton('asentado', 'Tipo de asentado', selectedValueLadrillo == 'Kingkong' ? asentadosKingkong : asentadosPandereta)
                        // child: ContentDropdownButton(type: 'asentado', description: 'Tipo de asentado', typeList: asentados, asentado: asentado,),
                      ),
                    ),
                    SizedBox(
                      child: CommonTextFormField(
                        description: 'Descripción' ,controller: _descriptionController, hintText: 'ej. Muro de la cocina', maxWidth: 180, isKeyboardText: true,),),
                    Row(
                      children: [
                        SizedBox(
                          child: CommonTextFormField(
                            description: 'Largo' ,controller: _largoController, hintText: 'metros', maxWidth: 70,),),
                        SizedBox(
                          child: CommonTextFormField(
                            description: 'Altura' ,controller: _alturaController, hintText: 'metros', maxWidth: 70,),),
                      ],
                    ),

                    //   SizedBox(child: Container(child: containTextFormField('longitud', 'longitud', 'metros'))),
                    //  SizedBox(child: Container(child: containTextFormField('altitud', 'altitud', 'metros'))),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text('Añadir muro'),
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
                  var datosLadrillo = ref.read(ladrilloResultProvider.notifier);
                  datosLadrillo.createLadrillo(description, ladrillo, asentado, largo, altura);
                  context.pushNamed('ladrillo_results');
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

  Widget contentDropdownButton(String type, String description, List<String> typeList) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(description),
                const SizedBox(width: 50,),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: DropdownButton(
                      value: type == 'ladrillo' ? selectedValueLadrillo : selectedValueAsentado,
                      items: typeList.map((e) => DropdownMenuItem(value: e,child: Text(e.toString()),)).toList(),
                      onChanged: (value) {
                        setState(() {
                          switch (type) {
                            case 'ladrillo':
                              selectedValueLadrillo = value;
                              ladrillo = selectedValueLadrillo!;
                              selectedValueAsentado = null;
                              break;
                            case 'asentado':
                              selectedValueAsentado = value;
                              asentado = selectedValueAsentado!;
                              break;
                          }
                        });
                      },
                      hint: const Text("Selecionar"),
                      underline: const SizedBox(),
                      isExpanded: true,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
