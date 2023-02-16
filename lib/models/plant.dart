import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/plant_card.dart';

class Plant {

  
  Plant({Key? key, 
    this.name = 'Weed', 
    this.isFaved = false, 
    this.description = 'Une plante magnifique', 
    this.growth = 'Lente', 
    this.consommation = 'Demande beaucoup d\'eau', 
    required this.imageUrl});

  String? name;
  String? description;
  String? growth;
  String? consommation;
  String imageUrl;
  bool isFaved;

  void setImageUrl(url) {
    imageUrl = url;
  }

  void setIsFaved(bool bool) {
    isFaved = bool;
  }

  dynamic get (String s) {
    Map attrib = {
      'name' : name,
      'description' : description,
      'growth' : growth, 
      'imageUrl' : url, 
      'consommation' : consommation, 
      'isFaved' : isFaved,
    };
    return attrib[s];
  }
}