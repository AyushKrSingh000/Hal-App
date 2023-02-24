import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';
import 'package:hal/src/ui/hire/hire_page_model.dart';
import 'package:hal/src/ui/hire/item_details/item_details_model.dart';
import 'package:hal/src/ui/hire/item_details/widgets/bottom_box.dart';
import 'package:hal/src/ui/hire/item_details/widgets/item_details_box.dart';
import 'package:hal/src/ui/hire/item_details/widgets/status_bar.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  final String itemId;

  const ItemDetailPage({super.key, required this.itemId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => ref.read(itemDetailsProvider.notifier).init(
            widget.itemId,
            ref.read(
              hirePageModelProvider.select(
                (_) => _.data!
                    .firstWhere((element) => element.itemId == widget.itemId),
              ),
            ),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemData = ref.watch(itemDetailsProvider.select((_) => _.data));
    final status = ref.read(itemDetailsProvider.select((_) => _.status));
    final detailsType = ref.read(itemDetailsProvider.select((_) => _.filter));
    return SafeArea(
      child: Scaffold(
        body: status == DetailsStatus.error
            ? const Center(
                child: Text('Something error happenend'),
              )
            : status == DetailsStatus.initial
                ? Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  )
                : itemData == null
                    ? const Center(
                        child: Text('No data found'),
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
                                    border: Border.all(
                                        width: 2, color: primaryColor),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height - 230,
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                      child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              color:
                                                  primaryColor.withOpacity(0.4),
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
                                    detailsType == TabStatus.itemDetails
                                        ? ItemDetails(
                                            itemData: itemData,
                                          )
                                        : Text('hello world'),
                                  ])),
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height - 96,
                              child: BottomBox(
                                cost: itemData.cost.toString(),
                                duration: itemData.date,
                              ),
                            ),
                          ],
                        ),
                      ),
      ),
    );
  }
}
