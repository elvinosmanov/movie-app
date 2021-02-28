import 'package:flutter/material.dart';
import 'package:movie_app/ui/home_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Movie App',
      home: HomePage(),
    );
  }
}
