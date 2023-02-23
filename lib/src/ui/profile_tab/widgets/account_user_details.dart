import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';
import 'package:hal/src/logic/repositories/app_repository/app_repository.dart';

class AccountUserDetails extends ConsumerWidget {
  const AccountUserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails =
        ref.watch(appRepositoryProvider.select((_) => _.userData));
    return Column(
      children: [
        userDetails == null
            ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 4,
                    color: primaryColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    userDetails.profilePicUrl,
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        const SizedBox(
          height: 12,
        ),
        Text(
          userDetails?.userName ?? "Your Name",
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
