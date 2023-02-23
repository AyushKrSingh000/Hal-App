import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../logic/repositories/app_repository/app_repository.dart';
import '../../../routing/router.gr.dart';
import '../../widgets/item_card.dart';
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
                  ? GestureDetector(
                      onTap: () {
                        context.navigateTo(
                          ItemDetailRoute(
                            itemId: data[index].itemId.toString(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ItemCard(
                          brandName: data[index].brandName,
                          itemId: data[index].itemId.toString(),
                          cost: data[index].cost.toString(),
                          duration: data[index].date,
                          status: data[index].status,
                        ),
                      ),
                    )
                  : const SizedBox();
            },
            itemCount: data.length,
          ));
  }
}
