import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';

class HomeModel {
  String imageAsset;
  String title;
  String location;
  Color bgColor;

  HomeModel({
    required this.imageAsset,
    required this.title,
    required this.location,
    required this.bgColor,
  });
  static List<HomeModel> generateTasks() {
    return [
      HomeModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Muro',
        location: 'muro',
        bgColor: getRandomColor(),
      ),
      HomeModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Columna',
        location: 'columna',
        bgColor: getRandomColor(),
      ),
      HomeModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Piso',
        location: 'pisos',
        bgColor: getRandomColor(),
      ),
      HomeModel(
        imageAsset: 'assets/images/perfil.png',
        title: 'Losa',
        location: 'losas',
        bgColor: getRandomColor(),
      ),
    ];
  }
}