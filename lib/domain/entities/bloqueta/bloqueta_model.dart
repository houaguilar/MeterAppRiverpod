class BloquetaModel {
  final String id;
 // final CellTypeResults tipo;
  final String description;
  final String tipoBloqueta;
  final String largo;
  final String altura;

  BloquetaModel({
    required this.id,
  //  required this.tipo,
    required this.description,
    required this.tipoBloqueta,
    required this.largo,
    required this.altura,
  });

  BloquetaModel copyWith({
    String? id,
  //  CellTypeResults? tipo,
    String? description,
    String? tipoBloqueta,
    String? largo,
    String? altura,
  }) => BloquetaModel(
    id: id ?? this.id,
  //  tipo: tipo ?? this.tipo,
    description: description ?? this.description,
    tipoBloqueta: tipoBloqueta ?? this.tipoBloqueta,
    largo: largo ?? this.largo,
    altura: altura ?? this.altura,
  );
}