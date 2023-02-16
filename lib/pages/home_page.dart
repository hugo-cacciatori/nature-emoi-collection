import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/widgets/plant_card.dart';
import 'package:nature_emoi_collection/widgets/plant_display.dart';
import 'package:nature_emoi_collection/widgets/plant_popup.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<HomePage> {

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var item in posters)
                            PlantCard(plant: item, refresh: refresh)
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Last Plants"),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight-310,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var item in plants)
                            PlantDisplay(plant: item, width: constraints.maxWidth, refresh: refresh)
                          ]
                        )
                      )
                    )
                  ]
                )
              ),
              if(selected_plant!=null) PlantPopup(plant: selected_plant!, width: constraints.maxWidth, height: constraints.maxHeight, refresh: refresh)
            ],
        );
      }
    );
  }
}
