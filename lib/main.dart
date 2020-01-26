import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/Components/AppBottomNavigationBarController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AppBottomNavigationBarController()
    );
  }
}