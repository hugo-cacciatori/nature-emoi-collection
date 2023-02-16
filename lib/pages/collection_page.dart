import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/widgets/plant_display.dart';

import '../constants.dart';
import '../widgets/plant_popup.dart';

class CollectionPage extends StatefulWidget {

  const CollectionPage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<CollectionPage> {

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: ((context, constraints) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for(var row in collection)
                      PlantDisplay(plant: row, width: constraints.maxWidth, refresh:  refresh)
                    ],
                  ),
                ),
                if(selected_plant!=null) PlantPopup(plant: selected_plant!, width: constraints.maxWidth, height: constraints.maxHeight, refresh: refresh)
              ]
            );
          })
    );
  }
}
