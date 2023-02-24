import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/ui/hire/item_details/widgets/status_bar.dart';

import '../../../../constants/constants.dart';
import '../../../../models/item_data.dart';
import '../description_box.dart';
import 'details_box.dart';

class ItemDetails extends ConsumerWidget {
  final ItemData itemData;
  const ItemDetails({super.key, required this.itemData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_location.png',
                    type: 'Location',
                    data: itemData.location,
                  ),
                  const SizedBox(width: 20),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_engine.png',
                    type: 'Engine Power',
                    data: itemData.power.toString(),
                  ),
                  const SizedBox(width: 20),
                  const DetailsBox(
                    imageUrl: 'assets/images/ic_time.png',
                    type: 'Total Hours',
                    data: '2000-3000',
                  ),
                  const SizedBox(width: 20),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_year.png',
                    type: 'Purchase Year',
                    data: itemData.year,
                  ),
                  const SizedBox(width: 20),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_rtono.png',
                    type: 'RTO NO.',
                    data: itemData.year,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_tyre.png',
                    type: 'Tyre Condition',
                    data:
                        '${itemData.condition * 70}% ${itemData.condition >= 0.5 ? "Good" : "Okey"}',
                  ),
                  const SizedBox(width: 20),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_condition.png',
                    type: 'Engine Condition',
                    data:
                        '${itemData.condition * 100}% ${itemData.condition >= 0.5 ? "Good" : "Okey"}',
                  ),
                  const SizedBox(width: 20),
                  const DetailsBox(
                    imageUrl: 'assets/images/ic_noc.png',
                    type: 'Financier/NOC',
                    data: 'NO',
                  ),
                  const SizedBox(width: 20),
                  DetailsBox(
                    imageUrl: 'assets/images/ic_rc.png',
                    type: 'RC',
                    data: itemData.rc ? 'Availabe' : 'Not Available',
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 0,
                thickness: 1,
                color: primaryColor.withOpacity(0.4),
              ),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DiscriptionBox(
                descritption: itemData.discription,
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
