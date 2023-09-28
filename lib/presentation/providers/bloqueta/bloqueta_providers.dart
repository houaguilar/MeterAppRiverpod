import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';
import '../../../domain/domain.dart';

part 'bloqueta_providers.g.dart';

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
}
