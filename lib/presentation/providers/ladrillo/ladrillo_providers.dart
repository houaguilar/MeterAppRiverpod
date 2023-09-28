import 'package:app_with_riverpod/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';

part 'ladrillo_providers.g.dart';

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
}