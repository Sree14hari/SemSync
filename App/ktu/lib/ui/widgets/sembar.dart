// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Sembar extends StatelessWidget implements PreferredSizeWidget {
  const Sembar({super.key});

  // Dummy value; AppBar uses this but we override with full screen height in build
  @override
  Size get preferredSize => const Size.fromHeight(170);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB39DDB), // Deep lavender (visible!)
            Color(0xFFCCBDF1),
            Color(0xFFD8CCF3),
            Color(0xFFE2DDF6),
            Color(0xFFEDECF9),
            Color(0xFFF5F3FC),
            Color(0xFFFBF9FE),
            Colors.white, // Final
          ],
          stops: [0.0, 0.25, 0.4, 0.55, 0.68, 0.78, 0.87, 1.0],
        ),
      ),

      child: Row(),
    );
  }
}
