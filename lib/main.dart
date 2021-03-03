import 'package:flutter/material.dart';
import 'package:testapp/ui_color.dart';

import 'homepview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        backgroundColor: appColors.appBackgroudColor,
        buttonTheme: ButtonThemeData(
          buttonColor: appColors.greenColor,
        ),
      ),
      home: HomePage(),
    );
  }
}
