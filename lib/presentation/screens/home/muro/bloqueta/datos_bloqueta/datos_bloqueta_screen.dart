import 'package:app_with_riverpod/presentation/providers/bloqueta/bloqueta_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/widgets.dart';


class DatosBloquetaScreen extends ConsumerStatefulWidget {
  const DatosBloquetaScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DatosBloquetaScreen> createState() => _DatosBloquetaScreenState();
}

class _DatosBloquetaScreenState extends ConsumerState<DatosBloquetaScreen> {

  late String bloqueta;

  String? selectedValueBloqueta;

  // GlobalKey
  final GlobalKey<FormState> _formKeyDescriptionMuro1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro1 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro2 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro3 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro4 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro5 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro5 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro5 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro6 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro6 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro6 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyDescriptionMuro7 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyLargoMuro7 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAlturaMuro7 = GlobalKey<FormState>();

  //textEditingControllers
  final TextEditingController _descriptionMuro1Controller =  TextEditingController();
  final TextEditingController _largoMuro1Controller =  TextEditingController();
  final TextEditingController _alturaMuro1Controller =  TextEditingController();

  final TextEditingController _descriptionMuro2Controller =  TextEditingController();
  final TextEditingController _largoMuro2Controller =  TextEditingController();
  final TextEditingController _alturaMuro2Controller =  TextEditingController();

  final TextEditingController _descriptionMuro3Controller =  TextEditingController();
  final TextEditingController _largoMuro3Controller =  TextEditingController();
  final TextEditingController _alturaMuro3Controller =  TextEditingController();

  final TextEditingController _descriptionMuro4Controller =  TextEditingController();
  final TextEditingController _largoMuro4Controller =  TextEditingController();
  final TextEditingController _alturaMuro4Controller =  TextEditingController();

  final TextEditingController _descriptionMuro5Controller =  TextEditingController();
  final TextEditingController _largoMuro5Controller =  TextEditingController();
  final TextEditingController _alturaMuro5Controller =  TextEditingController();

  final TextEditingController _descriptionMuro6Controller =  TextEditingController();
  final TextEditingController _largoMuro6Controller =  TextEditingController();
  final TextEditingController _alturaMuro6Controller =  TextEditingController();

  final TextEditingController _descriptionMuro7Controller =  TextEditingController();
  final TextEditingController _largoMuro7Controller =  TextEditingController();
  final TextEditingController _alturaMuro7Controller =  TextEditingController();

  @override
  Widget build(BuildContext context) {

    ref.watch(bloquetaResultProvider);
    final tipoBloqueta = ref.watch(tipoBloquetaProvider);
    final addMuro1 = ref.watch(addMuroBloqueta1Provider);
    final addMuro2 = ref.watch(addMuroBloqueta2Provider);
    final addMuro3 = ref.watch(addMuroBloqueta3Provider);
    final addMuro4 = ref.watch(addMuroBloqueta4Provider);
    final addMuro5 = ref.watch(addMuroBloqueta5Provider);
    final addMuro6 = ref.watch(addMuroBloqueta6Provider);
    final addMuro7 = ref.watch(addMuroBloqueta7Provider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const AppBarWidget(titleAppBar: 'Datos',),
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
                    Container(
                        alignment: AlignmentDirectional.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text("Muro 1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                    ),
                    SizedBox(
                      child: CommonTextFormField(
                        formKey: _formKeyDescriptionMuro1, description: 'Descripción' ,controller: _descriptionMuro1Controller, hintText: 'ej. Muro de la cocina', isKeyboardText: true,),),
                    SizedBox(
                      child: CommonTextFormField(
                        formKey: _formKeyLargoMuro1, description: 'Largo' ,controller: _largoMuro1Controller, hintText: 'metros',),),
                    SizedBox(
                      child: CommonTextFormField(
                        formKey: _formKeyAlturaMuro1, description: 'Altura' ,controller: _alturaMuro1Controller, hintText: 'metros',),),
                    Visibility(
                      visible: addMuro1,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        child: SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(addMuroBloqueta1Provider.notifier).toggleAddMuro();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Añadir muro"),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),                          )
                        ),
                      ),
                    ),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro2, formKey2: _formKeyLargoMuro2, formKey3: _formKeyAlturaMuro2, visibility: addMuro1, muro: "Muro 2", descriptionController: _descriptionMuro2Controller, largoController: _largoMuro2Controller, alturaController: _alturaMuro2Controller, buttonVisibility: addMuro2, pressed: () => ref.read(addMuroBloqueta2Provider.notifier).toggleAddMuro(),),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro3, formKey2: _formKeyLargoMuro3, formKey3: _formKeyAlturaMuro3, visibility: addMuro2, muro: "Muro 3", descriptionController: _descriptionMuro3Controller, largoController: _largoMuro3Controller, alturaController: _alturaMuro3Controller, buttonVisibility: addMuro3, pressed: () => ref.read(addMuroBloqueta3Provider.notifier).toggleAddMuro(),),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro4, formKey2: _formKeyLargoMuro4, formKey3: _formKeyAlturaMuro4, visibility: addMuro3, muro: "Muro 4", descriptionController: _descriptionMuro4Controller, largoController: _largoMuro4Controller, alturaController: _alturaMuro4Controller, buttonVisibility: addMuro4, pressed: () => ref.read(addMuroBloqueta4Provider.notifier).toggleAddMuro(),),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro5, formKey2: _formKeyLargoMuro5, formKey3: _formKeyAlturaMuro5, visibility: addMuro4, muro: "Muro 5", descriptionController: _descriptionMuro5Controller, largoController: _largoMuro5Controller, alturaController: _alturaMuro5Controller, buttonVisibility: addMuro5, pressed: () => ref.read(addMuroBloqueta5Provider.notifier).toggleAddMuro(),),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro6, formKey2: _formKeyLargoMuro6, formKey3: _formKeyAlturaMuro6, visibility: addMuro5, muro: "Muro 6", descriptionController: _descriptionMuro6Controller, largoController: _largoMuro6Controller, alturaController: _alturaMuro6Controller, buttonVisibility: addMuro6, pressed: () => ref.read(addMuroBloqueta6Provider.notifier).toggleAddMuro(),),
                    CustomAddWall(formKey1: _formKeyDescriptionMuro7, formKey2: _formKeyLargoMuro7, formKey3: _formKeyAlturaMuro7, visibility: addMuro6, muro: "Muro 7", descriptionController: _descriptionMuro7Controller, largoController: _largoMuro7Controller, alturaController: _alturaMuro7Controller, buttonVisibility: addMuro7, pressed: () => ref.read(addMuroBloqueta7Provider.notifier).toggleAddMuro(),),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final FormState formDescription1 = _formKeyDescriptionMuro1.currentState!;
                final FormState formLargo1 = _formKeyLargoMuro1.currentState!;
                final FormState formAltura1 = _formKeyAlturaMuro1.currentState!;

                var datosBloqueta = ref.read(bloquetaResultProvider.notifier);
                bloqueta = tipoBloqueta;

                if (formDescription1.validate() && formLargo1.validate() && formAltura1.validate()) {
                  datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                  if (addMuro1) {
                    context.pushNamed('bloqueta_results');
                  } else {
                    ref.read(bloquetaResultProvider.notifier).clearList();
                    final FormState formDescription2 = _formKeyDescriptionMuro2.currentState!;
                    final FormState formLargo2 = _formKeyLargoMuro2.currentState!;
                    final FormState formAltura2 = _formKeyAlturaMuro2.currentState!;

                    if (formDescription2.validate() && formLargo2.validate() && formAltura2.validate()) {
                      datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                      datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                      if (addMuro2) {
                        context.pushNamed('bloqueta_results');
                      } else {
                        ref.read(bloquetaResultProvider.notifier).clearList();
                        final FormState formDescription3 = _formKeyDescriptionMuro3.currentState!;
                        final FormState formLargo3 = _formKeyLargoMuro3.currentState!;
                        final FormState formAltura3 = _formKeyAlturaMuro3.currentState!;

                        if (formDescription3.validate() && formLargo3.validate() && formAltura3.validate()) {
                          datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                          datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                          datosBloqueta.createBloqueta(_descriptionMuro3Controller.text, bloqueta, _largoMuro3Controller.text, _alturaMuro3Controller.text);
                          if (addMuro3) {
                            context.pushNamed('bloqueta_results');
                          } else {
                            ref.read(bloquetaResultProvider.notifier).clearList();
                            final FormState formDescription4 = _formKeyDescriptionMuro4.currentState!;
                            final FormState formLargo4 = _formKeyLargoMuro4.currentState!;
                            final FormState formAltura4 = _formKeyAlturaMuro4.currentState!;
                            if (formDescription4.validate() && formLargo4.validate() && formAltura4.validate()) {
                              datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                              datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                              datosBloqueta.createBloqueta(_descriptionMuro3Controller.text, bloqueta, _largoMuro3Controller.text, _alturaMuro3Controller.text);
                              datosBloqueta.createBloqueta(_descriptionMuro4Controller.text, bloqueta, _largoMuro4Controller.text, _alturaMuro4Controller.text);
                              if (addMuro4) {
                                context.pushNamed('bloqueta_results');
                              } else {
                                ref.read(bloquetaResultProvider.notifier).clearList();
                                final FormState formDescription5 = _formKeyDescriptionMuro5.currentState!;
                                final FormState formLargo5 = _formKeyLargoMuro5.currentState!;
                                final FormState formAltura5 = _formKeyAlturaMuro5.currentState!;
                                if (formDescription5.validate() && formLargo5.validate() && formAltura5.validate()) {
                                  datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                                  datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                                  datosBloqueta.createBloqueta(_descriptionMuro3Controller.text, bloqueta, _largoMuro3Controller.text, _alturaMuro3Controller.text);
                                  datosBloqueta.createBloqueta(_descriptionMuro4Controller.text, bloqueta, _largoMuro4Controller.text, _alturaMuro4Controller.text);
                                  datosBloqueta.createBloqueta(_descriptionMuro5Controller.text, bloqueta, _largoMuro5Controller.text, _alturaMuro5Controller.text);
                                  if (addMuro5) {
                                    context.pushNamed('bloqueta_results');
                                  } else {
                                    ref.read(bloquetaResultProvider.notifier).clearList();
                                    final FormState formDescription6 = _formKeyDescriptionMuro6.currentState!;
                                    final FormState formLargo6 = _formKeyLargoMuro6.currentState!;
                                    final FormState formAltura6 = _formKeyAlturaMuro6.currentState!;
                                    if (formDescription6.validate() && formLargo6.validate() && formAltura6.validate()) {
                                      datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                                      datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                                      datosBloqueta.createBloqueta(_descriptionMuro3Controller.text, bloqueta, _largoMuro3Controller.text, _alturaMuro3Controller.text);
                                      datosBloqueta.createBloqueta(_descriptionMuro4Controller.text, bloqueta, _largoMuro4Controller.text, _alturaMuro4Controller.text);
                                      datosBloqueta.createBloqueta(_descriptionMuro5Controller.text, bloqueta, _largoMuro5Controller.text, _alturaMuro5Controller.text);
                                      datosBloqueta.createBloqueta(_descriptionMuro6Controller.text, bloqueta, _largoMuro6Controller.text, _alturaMuro6Controller.text);
                                      if (addMuro6) {
                                        context.pushNamed('bloqueta_results');
                                      } else {
                                        ref.read(bloquetaResultProvider.notifier).clearList();
                                        final FormState formDescription7 = _formKeyDescriptionMuro7.currentState!;
                                        final FormState formLargo7 = _formKeyLargoMuro7.currentState!;
                                        final FormState formAltura7 = _formKeyAlturaMuro7.currentState!;
                                        if (formDescription7.validate() && formLargo7.validate() && formAltura7.validate()) {
                                          datosBloqueta.createBloqueta(_descriptionMuro1Controller.text, bloqueta, _largoMuro1Controller.text, _alturaMuro1Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro2Controller.text, bloqueta, _largoMuro2Controller.text, _alturaMuro2Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro3Controller.text, bloqueta, _largoMuro3Controller.text, _alturaMuro3Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro4Controller.text, bloqueta, _largoMuro4Controller.text, _alturaMuro4Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro5Controller.text, bloqueta, _largoMuro5Controller.text, _alturaMuro5Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro6Controller.text, bloqueta, _largoMuro6Controller.text, _alturaMuro6Controller.text);
                                          datosBloqueta.createBloqueta(_descriptionMuro7Controller.text, bloqueta, _largoMuro7Controller.text, _alturaMuro7Controller.text);
                                          if (addMuro7) {
                                            context.pushNamed('bloqueta_results');
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }  else {
                  null;
                }
              },
              color: const Color(0x00ecf0f1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              height: 50,
              minWidth: 200,
              child: const Text("Metrar",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  void enabledButton(String tipoBloqueta, BuildContext context) {

    var datosBloqueta = ref.read(bloquetaResultProvider.notifier);
    bloqueta = tipoBloqueta;
    void createBloquetaIfNotEmpty(TextEditingController descriptionController, TextEditingController largoController, TextEditingController alturaController) {
      if (descriptionController.text.isNotEmpty && largoController.text.isNotEmpty && alturaController.text.isNotEmpty) {
        datosBloqueta.createBloqueta(descriptionController.text, bloqueta, largoController.text, alturaController.text);
      }
    }
    
    createBloquetaIfNotEmpty(_descriptionMuro1Controller, _largoMuro1Controller, _alturaMuro1Controller);
    createBloquetaIfNotEmpty(_descriptionMuro2Controller, _largoMuro2Controller, _alturaMuro2Controller);
    createBloquetaIfNotEmpty(_descriptionMuro3Controller, _largoMuro3Controller, _alturaMuro3Controller);
    createBloquetaIfNotEmpty(_descriptionMuro4Controller, _largoMuro4Controller, _alturaMuro4Controller);
    createBloquetaIfNotEmpty(_descriptionMuro5Controller, _largoMuro5Controller, _alturaMuro5Controller);
    createBloquetaIfNotEmpty(_descriptionMuro6Controller, _largoMuro6Controller, _alturaMuro6Controller);
    createBloquetaIfNotEmpty(_descriptionMuro7Controller, _largoMuro7Controller, _alturaMuro7Controller);
    
    context.pushNamed('bloqueta_results');
  }
}


/*void createBloquetaIfNotEmpty(TextEditingController descriptionController, TextEditingController largoController, TextEditingController alturaController) {
                      if (descriptionController.text.isNotEmpty && largoController.text.isNotEmpty && alturaController.text.isNotEmpty) {
                        datosBloqueta.createBloqueta(descriptionController.text, bloqueta, largoController.text, alturaController.text);
                      }
                    }
                    createBloquetaIfNotEmpty(_descriptionMuro1Controller, _largoMuro1Controller, _alturaMuro1Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro2Controller, _largoMuro2Controller, _alturaMuro2Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro3Controller, _largoMuro3Controller, _alturaMuro3Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro4Controller, _largoMuro4Controller, _alturaMuro4Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro5Controller, _largoMuro5Controller, _alturaMuro5Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro6Controller, _largoMuro6Controller, _alturaMuro6Controller);
                    createBloquetaIfNotEmpty(_descriptionMuro7Controller, _largoMuro7Controller, _alturaMuro7Controller);*/
