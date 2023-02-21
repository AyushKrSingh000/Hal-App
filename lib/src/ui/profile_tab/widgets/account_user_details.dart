import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';

class AccountUserDetails extends ConsumerWidget {
  const AccountUserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.jpg',
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Ayush Kumar Singh",
          style: GoogleFonts.poppins(
              fontSize: 23, color: primaryColor, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Member",
          style: GoogleFonts.poppins(
              fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
