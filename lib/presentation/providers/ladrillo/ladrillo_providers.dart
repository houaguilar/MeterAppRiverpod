import 'package:app_with_riverpod/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';

part 'ladrillo_providers.g.dart';

@riverpod
class TipoLadrillo extends _$TipoLadrillo {
  @override
  String build() => '';

  void selectLadrillo(String name) {
    state = name;
  }
}

@riverpod
class LadrilloResult extends _$LadrilloResult {

  @override
  List<LadrilloModel> build() => [];

  void createLadrillo(
      String description,
      String tipoLadrillo,
      String tipoAsentado,
      String largo,
      String altura,
      ) {
    state = [
      ...state, LadrilloModel(id: uuid.v4(), description: description, tipoLadrillo: tipoLadrillo, tipoAsentado: tipoAsentado, largo: largo, altura: altura)
    ];
  }

  void clearList() {
    state.clear();
  }
}

@riverpod
class AddMuroLadrillo1 extends _$AddMuroLadrillo1 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo2 extends _$AddMuroLadrillo2 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo3 extends _$AddMuroLadrillo3 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo4 extends _$AddMuroLadrillo4 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo5 extends _$AddMuroLadrillo5 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo6 extends _$AddMuroLadrillo6 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}

@riverpod
class AddMuroLadrillo7 extends _$AddMuroLadrillo7 {
  @override
  bool build() => true;

  void toggleAddMuro() {
    state = !state;
  }
}