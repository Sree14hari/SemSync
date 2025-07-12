import 'package:flutter/cupertino.dart';

class KtuApp extends StatelessWidget {
  const KtuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: CupertinoColors.systemGrey,
      home: const Center(child: Text('Hello, KTU!')),
    );
  }
}
