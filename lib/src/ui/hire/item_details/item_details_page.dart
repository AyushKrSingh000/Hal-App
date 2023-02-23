import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';
import 'package:hal/src/ui/hire/hire_page_model.dart';
import 'package:hal/src/ui/hire/item_details/widgets/bottom_box.dart';
import 'package:hal/src/ui/hire/item_details/widgets/details_box.dart';
import 'package:hal/src/ui/hire/item_details/widgets/status_bar.dart';

class ItemDetailPage extends ConsumerWidget {
  final String itemId;
  const ItemDetailPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemData = ref.watch(hirePageModelProvider.select(
        (_) => _.data?.firstWhere((element) => element.itemId == itemId)));
    return SafeArea(
      child: Scaffold(
        body: itemData == null
            ? const Center(
                child: Text('No Data Found'),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      child: Image.asset(
                        'assets/images/Rectangle 54.png',
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 230,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: primaryColor),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height - 230,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      FittedBox(
                                        child: Text(
                                          '${itemData.year} ${itemData.brandName} ${itemData.modelName}',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Divider(
                                          height: 0,
                                          thickness: 1,
                                          color: primaryColor.withOpacity(0.4),
                                        ),
                                      ),
                                      StatusBar(status: itemData.status),
                                      Text(
                                        'Equipment Details',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_location.png',
                                            type: 'Location',
                                            data: itemData.location,
                                          ),
                                          const SizedBox(width: 20),
                                          DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_engine.png',
                                            type: 'Engine Power',
                                            data: itemData.power.toString(),
                                          ),
                                          const SizedBox(width: 20),
                                          const DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_time.png',
                                            type: 'Total Hours',
                                            data: '2000-3000',
                                          ),
                                          const SizedBox(width: 20),
                                          DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_year.png',
                                            type: 'Purchase Year',
                                            data: itemData.year,
                                          ),
                                          const SizedBox(width: 20),
                                          DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_rtono.png',
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
                                            imageUrl:
                                                'assets/images/ic_tyre.png',
                                            type: 'Tyre Condition',
                                            data:
                                                '${itemData.condition * 70}% ${itemData.condition >= 0.5 ? "Good" : "Okey"}',
                                          ),
                                          const SizedBox(width: 20),
                                          DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_condition.png',
                                            type: 'Engine Condition',
                                            data:
                                                '${itemData.condition * 100}% ${itemData.condition >= 0.5 ? "Good" : "Okey"}',
                                          ),
                                          const SizedBox(width: 20),
                                          const DetailsBox(
                                            imageUrl:
                                                'assets/images/ic_noc.png',
                                            type: 'Financier/NOC',
                                            data: 'NO',
                                          ),
                                          const SizedBox(width: 20),
                                          DetailsBox(
                                            imageUrl: 'assets/images/ic_rc.png',
                                            type: 'RC',
                                            data: itemData.rc
                                                ? 'Availabe'
                                                : 'Not Available',
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Divider(
                                        height: 0,
                                        thickness: 1,
                                        color: primaryColor.withOpacity(0.4),
                                      ),
                                      const SizedBox(
                                        height: 150,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height - 96,
                      child: const BottomBox(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
