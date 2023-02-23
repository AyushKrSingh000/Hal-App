import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../logic/repositories/app_repository/app_repository.dart';

class ItemCard extends ConsumerWidget {
  final String brandName;
  final String cost;
  final String duration;
  final bool status;
  final String itemId;

  const ItemCard({
    super.key,
    required this.brandName,
    required this.cost,
    required this.duration,
    required this.status,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites =
        ref.watch(appRepositoryProvider.select((_) => _.userData?.favourites));
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: primaryColor,
            blurRadius: 10,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Rectangle 54.png',
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Text(
                        'Brand : $brandName',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      'Cost : $cost',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'Available For : $duration',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    Row(
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
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              status ? "Available" : "Not Available",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: status
                                    ? const Color.fromARGB(255, 15, 156, 88)
                                    : Colors.red,
                              ),
                            ),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 75,
              left: MediaQuery.of(context).size.width - 80,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(appRepositoryProvider.notifier)
                      .setFavourites(itemId.toString());
                },
                child: Icon(
                  favourites == null
                      ? CupertinoIcons.heart
                      : favourites.contains(itemId)
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
