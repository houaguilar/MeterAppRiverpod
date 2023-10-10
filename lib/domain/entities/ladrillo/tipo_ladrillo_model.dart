class TipoLadrilloModel {
  String imageAsset;
  String title;
  String location;

  TipoLadrilloModel({
    required this.imageAsset,
    required this.title,
    required this.location,
  });
  static List<TipoLadrilloModel> generateTipoLadrillo() {
    return [
      TipoLadrilloModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Kingkong',
        location: 'ladrillo1',
      ),
      TipoLadrilloModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Pandereta',
        location: 'ladrillo1',
      ),
      TipoLadrilloModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Kingkong',
        location: 'ladrillo1',
      ),
      TipoLadrilloModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Pandereta',
        location: 'ladrillo1',
      ),
    ];
  }
}