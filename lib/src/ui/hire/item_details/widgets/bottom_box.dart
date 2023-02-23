import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants.dart';

class BottomBox extends ConsumerWidget {
  const BottomBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: primaryColor,
      height: 72,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: primaryColor,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                color: secondaryColor,
                blurRadius: 2,
              ),
            ],
          ),
          child: Center(
              child: Text(
            'Hire Now',
            style: GoogleFonts.roboto(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          )),
        ),
      ),
    );
  }
}
