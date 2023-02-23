import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../logic/repositories/app_repository/app_repository.dart';
import '../hire_page_model.dart';

class FavouriteList extends ConsumerWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(hirePageModelProvider.select((_) => _.data));
    final favourites =
        ref.watch(appRepositoryProvider.select((_) => _.userData?.favourites));
    return favourites!.isEmpty || data == null
        ? Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  'No Favourites',
                  style: GoogleFonts.roboto(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 100, top: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return favourites.contains(data[index].itemId)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.75,
                                        child: Text(
                                          'Brand : ${data[index].brandName}',
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
                                        'Cost : ${data[index].cost}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Available For : ${data[index].date}',
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                data[index].status
                                                    ? "Available"
                                                    : "Not Available",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  color: data[index].status
                                                      ? const Color.fromARGB(
                                                          255, 15, 156, 88)
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
                                        .setFavourites(
                                            data[index].itemId.toString());
                                  },
                                  child: Icon(
                                    favourites == null
                                        ? CupertinoIcons.heart
                                        : favourites
                                                .contains(data[index].itemId)
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
            itemCount: data.length,
          ));
  }
}
