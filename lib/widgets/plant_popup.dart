import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/constants.dart';

import '../models/plant.dart';

class PlantPopup extends StatelessWidget {

  PlantPopup({Key? key, required this.plant, required this.width, required this.height, required this.refresh});

  Plant plant;
  double width;
  double height;
  Function refresh;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.05 * width, 0.05 * height, 0.05 * width, 0.15 * height),
      width: 0.9 * width,
      height: 0.8 * height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: graphMap['white'],
          boxShadow: [BoxShadow(color: graphMap['grey'], spreadRadius: 6, blurRadius: 14)]),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(plant.get('imageUrl'),
                        width: 70, height: 70, fit: BoxFit.fill)),
                Container(
                  width: 0.9 * width - 70 - 30 - 40,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(plant.get('name'),
                      textAlign: TextAlign.center),
                ),
                Container(
                    width: 30,
                    height: 70,
                    child: IconButton(
                        icon: Icon(Icons.close, size: 30),
                        color: graphMap['black'],
                        onPressed: () {
                          selected_plant = null;
                          refresh();
                        }))
              ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Description"),
            Text(plant.get('description'))
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Growth"),
            Text(plant.get('growth'))
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Water consumption"),
            Text(plant.get('consommation'))
          ]),
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                icon: Icon(Icons.delete, size: 30, color: graphMap['black']),
                onPressed: () {
                  if (plant.get('isFaved')) collection.remove(plant);
                  if (posters.contains(plant)) posters.remove(plant);
                  plants.remove(plant);
                  selected_plant = null;
                  refresh();
                }),
            plant.get('isFaved')
                ? IconButton(
                    onPressed: () {
                      plant.setIsFaved(false);
                      collection.remove(plant);
                      refresh();
                    },
                    icon: Icon(Icons.star, color: graphMap['green'], size: 30))
                : IconButton(
                    onPressed: () {
                      plant.setIsFaved(true);
                      collection.insert(0, plant);
                      refresh();
                    },
                    icon: Icon(Icons.star_border, color: graphMap['black'], size: 30)),
          ])
        ],
      )),
    );
  }


  
}