import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants.dart';

class DetailsBox extends StatelessWidget {
  final String imageUrl;
  final String type;
  final String data;
  const DetailsBox(
      {super.key,
      required this.imageUrl,
      required this.data,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 6),
              color: primaryColor,
            ),
          ]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imageUrl,
          height: 100,
          width: 120,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          type,
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: primaryColor,
          ),
        )
      ]),
    );
  }
}
