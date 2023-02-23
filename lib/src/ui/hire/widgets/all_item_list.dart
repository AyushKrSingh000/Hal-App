import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/routing/router.gr.dart';
import 'package:hal/src/ui/profile_tab/widgets/widgets.dart';
import 'package:hal/src/ui/widgets/item_card.dart';
import '../../../constants/constants.dart';
import '../../../logic/repositories/app_repository/app_repository.dart';
import '../hire_page_model.dart';

class AllItemList extends ConsumerWidget {
  const AllItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(hirePageModelProvider.select((_) => _.data));

    return data == null
        ? const Center(
            child: Text('No Data'),
          )
        : Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 100, top: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.navigateTo(
                      ItemDetailRoute(
                        itemId: data[index].itemId.toString(),
                      ),
                    );
                  },
                  child: ItemCard(
                    brandName: data[index].brandName,
                    itemId: data[index].itemId.toString(),
                    cost: data[index].cost.toString(),
                    duration: data[index].date,
                    status: data[index].status,
                  ),
                ),
              );
            },
            itemCount: data.length,
          ));
  }
}
