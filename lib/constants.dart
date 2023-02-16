import 'package:flutter/material.dart';

import 'models/plant.dart';


final Map<String, dynamic> graphMap = {
    'white' : Color(0xFFffffff),
    'black' : Color(0xff202122),
    'grey' : Color(0xff989CA0),
    'mobile': Color(0xFFffffff),
    'tablet': Color(0xff00FFF3),
    'red' : Color(0xffe03210),
    'selectedIcon' : Color(0xff4d4a43),
    'green' : Color(0xff77D353),
    'desktop' : Color(0xff55edc7)
  };

final String url = 'https://merriam-webster.com/assets/ld/word_of_the_day/images/2777/large.jpg';

List<Plant> plants = get_plants();
List collection = get_collection();
List posters = get_posters();
Plant? selected_plant;

List<Plant> get_plants() {
  List<Plant> out = [];
  for (var i = 0; i < 20; i++) {
    out.add(Plant(imageUrl: url));
  }
  return out;
}

List get_collection() {
  List out = [];
  for (var i = 0; i < 5; i++) {
    plants[i].setIsFaved(true);
    out.add(plants[i]);
  }
  return out;
}

List get_posters() {
  List out = [];
  for (var i = 5; i < 10; i++) {
    plants[i].setImageUrl(url);
    out.add(plants[i]);
  }
  return out;
}
