import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_page.dart';
import 'about_page.dart';
//import 'common_widgets.dart'; // Import common widgets

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/calculator': (context) => CalculatorPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
