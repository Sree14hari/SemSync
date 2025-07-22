// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ktu/domain/constants/colors.dart';

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
            Color(0xFF90B4F2), // Original blue
            Color(0xFF9BBBF3),
            Color(0xFFA7C2F5),
            Color(0xFFB2CAF6),
            Color(0xFFBDD2F8),
            Color(0xFFC9D9F9),
            Color(0xFFD4E2FB),
            Color(0xFFFFFFFF),
          ],
        ),
      ),

      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Text(
                    'SEMSYNC',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textColor,
                    ),
                    onPressed: () {
                      // Handle notification button press
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SearchBar(
                hintText: 'Quick search pyqs...',
                elevation: WidgetStateProperty.all(0.0),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFF90B4F2), width: 1),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xffE4EDFE),
                ),
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                trailing: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.mic, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
