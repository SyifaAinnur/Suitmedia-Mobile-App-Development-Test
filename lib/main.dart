import 'package:flutter/material.dart';
import 'package:suitmedia_test/config/theme.dart';
import 'package:suitmedia_test/screen/home/home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // getItInject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screening Test Suitmedia',
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
