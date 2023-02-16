import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_emoi_collection/constants.dart';
import '../models/plant.dart';
import '../widgets/button.dart';
import '../widgets/field.dart';

class RegisterPlantPage extends StatefulWidget {
  const RegisterPlantPage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<RegisterPlantPage> {
  TextEditingController _nom = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _croissance = TextEditingController();
  TextEditingController _consommation = TextEditingController();

  String _msg = "";
  TextStyle? _msgStyle = null;

  String? image_path = 'assets/images/sprout.jpg';
  File? image_file;
  final ImagePicker _picker = ImagePicker();

  pick_image() async {
    final picked_image = await _picker.pickImage(source: ImageSource.gallery);
    if (picked_image != null) {
      setState(() {
        image_path = picked_image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Row(children: [
                    BUTTON(graphMap['green'], (constraints.maxWidth - 40) * 2 / 3, () {
                      pick_image();
                    }, "Upload Image"),
                    Container(
                        width: (constraints.maxWidth - 40) * 1 / 3,
                        height: 60,
                        child: Image.network(image_path!, fit: BoxFit.cover))
                  ]),
                  FIELD(constraints.maxWidth - 40, "Plant Name", _nom,
                      (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Description", _description,
                      (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Slow Growth",
                      _croissance, (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Low Consumption",
                      _consommation, (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  BUTTON(graphMap['black'], constraints.maxWidth - 40, () {
                    if (_nom.text != "" &&
                        _description.text != "" &&
                        _croissance.text != "" &&
                        _consommation.text != "" &&
                        image_path != "") {
                      setState(() {
                        plants.insert(
                            0,
                            Plant(
                              name: _nom.text,
                              description: _description.text,
                              growth: _croissance.text,
                              consommation: _consommation.text,
                              imageUrl:  image_path!,
                              isFaved:  false));
                        _msg = "Nouvelle plante ajoutée avec succès !";
                        _nom.text = "";
                        _description.text = "";
                        _croissance.text = "";
                        _consommation.text = "";
                        image_path = "assets/images/sprout.jpg";
                      });
                    } else {
                      setState(() {
                        _msg = "Il y a eu une erreur...";
                      });
                    }
                  }, "Confirmer"),
                  SizedBox(height: 20),
                  Text(_msg, style: _msgStyle)
                ])));
      }),
    );
  }
}
