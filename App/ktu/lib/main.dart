import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktu/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // For dark icons, use .light for white icons
    ),
  );
  runApp(const KtuApp());
}
