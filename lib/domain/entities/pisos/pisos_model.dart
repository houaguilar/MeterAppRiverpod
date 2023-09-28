class PisosModel {
  final String id;
  // final CellTypeResults tipo;
  final String tipo;
  final String description;
  final String largo;
  final String ancho;
  final String altura;

  PisosModel({
    required this.id,
    //  required this.tipo,
    required this.tipo,
    required this.description,
    required this.largo,
    required this.ancho,
    required this.altura,
  });

  PisosModel copyWith({
    String? id,
    //  CellTypeResults? tipo,
    String? tipo,
    String? description,
    String? largo,
    String? ancho,
    String? altura,
  }) => PisosModel(
    id: id ?? this.id,
    //  tipo: tipo ?? this.tipo,
    tipo: tipo ?? this.tipo,
    description: description ?? this.description,
    largo: largo ?? this.largo,
    ancho: ancho ?? this.ancho,
    altura: altura ?? this.altura,
  );
}