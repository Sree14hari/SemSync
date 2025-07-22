// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
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
            Color(0xFFA7C2F5), // Slightly lighter
            Color(0xFFBDD2F8), // Softer blue
            Color(0xFFD4E2FB), // Almost white
            Color(0xFFFFFFFF), // White
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
          ],
        ),
      ),
    );
  }
}
