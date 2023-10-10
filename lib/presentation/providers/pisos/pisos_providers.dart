
import 'package:app_with_riverpod/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';

part 'pisos_providers.g.dart';

@riverpod
class TipoPiso extends _$TipoPiso {
  @override
  String build() => '';

  void selectPiso(String name) {
    state = name;
  }
}

@riverpod
class PisosResult extends _$PisosResult {
  @override
  List<PisosModel> build() => [];

  void createPisos(
      String tipo,
      String description,
      String largo,
      String ancho,
      String altura,
      ) {
    state = [
      ...state, PisosModel(id: uuid.v4(), tipo: tipo, description: description, largo: largo, ancho: ancho, altura: altura)
    ];
  }

  void clearList() {
    state.clear();
  }
}

@riverpod
class AddPiso1 extends _$AddPiso1 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso2 extends _$AddPiso2 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso3 extends _$AddPiso3 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso4 extends _$AddPiso4 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso5 extends _$AddPiso5 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso6 extends _$AddPiso6 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}

@riverpod
class AddPiso7 extends _$AddPiso7 {
  @override
  bool build() => true;

  void toggleAddPiso() {
    state = !state;
  }
}