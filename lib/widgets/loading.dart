


import 'package:flutter/material.dart';

import '../constants.dart';


class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: graphMap['mobile']);
  }
}