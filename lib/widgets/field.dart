import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/constants.dart';


Widget FIELD(width, placeholder, controller, onChanged) {
  return Container(
    width: width,
    height: 70,
    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: TextField(
      cursorColor: graphMap['green'],
      controller: controller,
      onChanged: onChanged,
      // style: DEFAULT,
      decoration: InputDecoration(
        hintText: placeholder,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: graphMap['grey'])),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: graphMap['grey'])),
        contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0)
      ),
    )
  );
}