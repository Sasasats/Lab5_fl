import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lab5_fl/json_parsing/json_parsing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(JsonLab());
}

class JsonLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParsing(),
    );
  }
}
