
import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/constants.dart';

import '../models/plant.dart';

class PlantCard extends StatelessWidget {

  PlantCard({Key? key, required this.plant, required this.refresh});

  Function refresh;
  Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                    onTap: () {
                      selected_plant = plant;
                      refresh();
                    },
                    child: Image.network(plant.get('imageUrl'),
                        width: 180, height: 230, fit: BoxFit.fill))),
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
                    icon: Icon(Icons.star, color: graphMap['white'], size: 24))
          ],
        ));
  }


}