import 'package:flutter/material.dart';
import 'produits_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produits',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFFBEAFF), // fond violet clair
      ),
      home: const ProduitsList(),
    );
  }
}
