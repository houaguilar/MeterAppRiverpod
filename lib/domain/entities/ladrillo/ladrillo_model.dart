class LadrilloModel {
  final String id;
 // final CellTypeResults tipo;
  final String description;
  final String tipoLadrillo;
  final String tipoAsentado;
  final String largo;
  final String altura;

  LadrilloModel({
    required this.id,
  //  required this.tipo,
    required this.description,
    required this.tipoLadrillo,
    required this.tipoAsentado,
    required this.largo,
    required this.altura,
  });

  LadrilloModel copyWith({
    String? id,
  //  CellTypeResults? tipo,
    String? description,
    String? tipoLadrillo,
    String? tipoAsentado,
    String? largo,
    String? altura,
  }) => LadrilloModel(
    id: id ?? this.id,
  //  tipo: tipo ?? this.tipo,
    description: description ?? this.description,
    tipoLadrillo: tipoLadrillo ?? this.tipoLadrillo,
    tipoAsentado: tipoAsentado ?? this.tipoAsentado,
    largo: largo ?? this.largo,
    altura: altura ?? this.altura,
  );
}