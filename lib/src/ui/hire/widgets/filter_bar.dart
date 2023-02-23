import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../hire_page_model.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xFFC2E854),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            ref
                .read(hirePageModelProvider.notifier)
                .setFilterType(FilterStatus.all);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              CupertinoIcons.home,
              color: primaryColor,
              size: 25,
            ),
            Text(
              'All',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ]),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            ref
                .read(hirePageModelProvider.notifier)
                .setFilterType(FilterStatus.favourites);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
              size: 25,
            ),
            Text(
              'Favourites',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
