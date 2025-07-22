import 'package:flutter/material.dart';
import 'package:ktu/ui/widgets/sembar.dart';

class KtuApp extends StatelessWidget {
  const KtuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SEMSYNC",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: Sembar(),
        body: Center(),
        // <-- Add this line
      ),
    );
  }
}
