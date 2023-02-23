import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants.dart';

class StatusBar extends ConsumerWidget {
  final bool status;
  const StatusBar({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            "Status : ",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                status ? "Available" : "Not Available",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: status
                      ? const Color.fromARGB(255, 15, 156, 88)
                      : Colors.red,
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
