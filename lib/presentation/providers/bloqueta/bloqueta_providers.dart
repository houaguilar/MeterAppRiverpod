import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';
import '../../../domain/domain.dart';

part 'bloqueta_providers.g.dart';

@riverpod
class TipoBloqueta extends _$TipoBloqueta {
  @override
  String build() => '';

  void selectBloqueta(String name) {
    state = name;
  }
}

@riverpod
class BloquetaResult extends _$BloquetaResult {

  @override
  List<BloquetaModel> build() => [];

  void createBloqueta(
      String description,
      String tipoBloqueta,
      String largo,
      String altura,
      ) {
    state = [
      ...state, BloquetaModel(id: uuid.v4(), description: description, tipoBloqueta: tipoBloqueta, largo: largo, altura: altura)
    ];
  }

  void clearList() {
    state.clear();
  }

  void areaTotal() {

  }
}

@riverpod
class AddMuroBloqueta1 extends _$AddMuroBloqueta1 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta2 extends _$AddMuroBloqueta2 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta3 extends _$AddMuroBloqueta3 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta4 extends _$AddMuroBloqueta4 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta5 extends _$AddMuroBloqueta5 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta6 extends _$AddMuroBloqueta6 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroBloqueta7 extends _$AddMuroBloqueta7 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}
