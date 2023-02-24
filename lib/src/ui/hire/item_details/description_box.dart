import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class DiscriptionBox extends ConsumerWidget {
  final String descritption;
  const DiscriptionBox({super.key, required this.descritption});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Center(
            child: Text(
          descritption,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
            color: primaryColor,
          ),
        )),
      ),
    );
  }
}
