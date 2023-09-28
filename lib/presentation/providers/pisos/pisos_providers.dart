
import 'package:app_with_riverpod/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/constants/constant.dart';

part 'pisos_providers.g.dart';

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
}
