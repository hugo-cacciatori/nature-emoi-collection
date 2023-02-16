
import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/constants.dart';

import '../models/plant.dart';

class PlantDisplay extends StatelessWidget {

  PlantDisplay({Key? key, required this.plant, required this.refresh, required this.width});

  Plant plant;
  Function refresh;
  double width;

  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: GestureDetector(
            onTap: () {
              selected_plant = plant;
              refresh();
            },
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(plant.get('imageUrl'),
                        width: 70, height: 70, fit: BoxFit.fill)),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    width: 0.8 * width - 70,
                    height: 65,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(nom, style: SUB_TITLE),
                          // Text(description, style: DEFAULT)
                        ])),
                plant.get('isFaved')
                    ? IconButton(
                        onPressed: () {
                          plant.setIsFaved(false);
                          collection.remove(plant);
                          refresh();
                        },
                        icon: Icon(Icons.star, color: graphMap['green'], size: 24))
                    : IconButton(
                        onPressed: () {
                          plant.setIsFaved(true);
                          collection.insert(0, plant);
                          refresh();
                        },
                        icon: Icon(Icons.star_border, color: graphMap['black'], size: 24))
              ],
            )));
  }

}