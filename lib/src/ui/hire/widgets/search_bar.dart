import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: primaryColor,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                style: GoogleFonts.roboto(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF555555),
                ),
                textAlignVertical: TextAlignVertical.bottom,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.search),
                  prefixIconColor: primaryColor,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFFC2E854),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFFC2E854),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color(0xFFC2E854),
                  ),
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white),
              child: Icon(
                CupertinoIcons.person_alt,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
