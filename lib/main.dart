import 'package:flutter/material.dart';
import 'package:flutter_part2/pages/learn_getx.dart';
import 'package:flutter_part2/pages/home_page1.dart';
import 'package:flutter_part2/pages/note_page/home_page.dart';
import 'package:flutter_part2/pages/product_page/product_page.dart';
import 'package:flutter_part2/pages/note_page/sqlite_test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
