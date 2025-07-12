import 'package:flutter/material.dart';

class KtuApp extends StatelessWidget {
  const KtuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SEMSYNC",
      home: Scaffold(appBar: AppBar()),
    );
  }
}
