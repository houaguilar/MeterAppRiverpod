import 'package:app_with_riverpod/presentation/providers/bloqueta/bloqueta_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class DatosBloquetaScreen extends ConsumerStatefulWidget {
  const DatosBloquetaScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DatosBloquetaScreen> createState() => _DatosBloquetaScreenState();
}

class _DatosBloquetaScreenState extends ConsumerState<DatosBloquetaScreen> {


  List<String> bloquetas = ["P7", "P10", 'P12'];

  late String bloqueta;
  late String largo;
  late String altura;

  String? selectedValueBloqueta;

  final _formStateLargo = GlobalKey<FormState>();
  final _formStateAltura = GlobalKey<FormState>();
  final textLongitudController = TextEditingController();
  final textAltitudController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.watch(bloquetaResultProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloqueta',),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                          child: _contentDropdownButton('bloqueta', 'Tipo de bloqueta', bloquetas)
                        //  child: ContentDropdownButton(type: 'ladrillo', description: 'Tipo de ladrillo', typeList: ladrillos, ladrillo: ladrillo,),
                      ),
                    ),
                    SizedBox(child: Container(child: _containTextFormField('longitud', 'longitud', 'metros'))),
                    SizedBox(child: Container(child: _containTextFormField('altitud', 'altitud', 'metros'))),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: const Text('Añadir muro'),

                        )
                    ),
                    const SizedBox(height: 90,)
                  ],
                ),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  var datosBloqueta = ref.read(bloquetaResultProvider.notifier);
                  datosBloqueta.createBloqueta('description', bloqueta, largo, altura);
                  context.pushNamed('bloqueta_results');

                },
                child: const Text("Metrar",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    )
                )
            ),
            const SizedBox(height: 100,)

          ],
        ),
      ),
    );
  }

  Widget _contentDropdownButton(String type, String description, List<String> typeList) {
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
                      value: selectedValueBloqueta,
                      items: typeList.map((e) => DropdownMenuItem(value: e,child: Text(e.toString()),)).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValueBloqueta = value;
                          bloqueta = selectedValueBloqueta!;
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

  Widget _containTextFormField(String type, String description, String hintText) {
    final ScrollController scrollControllerLongitud = ScrollController();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Form(
          key: type == 'longitud' ? _formStateLargo : _formStateAltura,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description),
              const SizedBox(width: 50,),
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: type == 'longitud' ? textLongitudController : textAltitudController,
                    onChanged: (value) {
                      setState(() {
                        switch (type) {
                          case 'longitud':
                            largo = textLongitudController.text;
                            break;
                          case 'altitud':
                            altura = textAltitudController.text;
                            break;
                        }
                      });
                    },
                    onFieldSubmitted: (String value) {
                      if (scrollControllerLongitud.hasClients) {
                        scrollControllerLongitud.animateTo(
                            scrollControllerLongitud.position.minScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInBack);
                      }
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(hintText),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              //     const Text('metros')
            ],
          ),
        ),
      ),
    );
  }
}