import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountTabItems extends ConsumerWidget {
  const AccountTabItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      primary: false,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                items[index].title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: items.length - 1 == index
                  ? null
                  : Text(
                      '>',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                      ),
                    ),
              contentPadding: const EdgeInsets.only(
                left: 30.0,
                top: 7,
                right: 30.0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class Settingitems {
  String title;
  String iconUrl;

  Settingitems({
    required this.title,
    required this.iconUrl,
  });
}

List<Settingitems> items = [
  Settingitems(title: 'Profile', iconUrl: 'assets/images/ic_profile.svg'),
  Settingitems(
      title: 'Terms of service', iconUrl: 'assets/images/ic_paper.svg'),
  Settingitems(title: 'Privacy Policy', iconUrl: 'assets/images/ic_files.svg'),
  Settingitems(title: 'Sign Out', iconUrl: 'assets/images/ic_power.svg')
];
