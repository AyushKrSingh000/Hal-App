import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hal/src/constants/constants.dart';
import 'package:hal/src/ui/hire/hire_page_model.dart';
import 'package:hal/src/ui/hire/widgets/all_item_list.dart';
import 'package:hal/src/ui/hire/widgets/favourite_page.dart';
import 'package:hal/src/ui/hire/widgets/filter_bar.dart';
import 'package:hal/src/ui/hire/widgets/search_bar.dart';

class HireTab extends ConsumerStatefulWidget {
  const HireTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HireTabState();
}

class _HireTabState extends ConsumerState<HireTab> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(hirePageModelProvider.select((_) => _.status));
    final filterStatus =
        ref.watch(hirePageModelProvider.select((_) => _.filter));
    return SafeArea(
        child: status == HirePageStatus.dataLoaded
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SearchBar(),
                    const FilterBar(),
                    filterStatus == FilterStatus.all
                        ? const AllItemList()
                        : const FavouriteList(),
                  ],
                ),
              )
            : status == HirePageStatus.initial
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SearchBar(),
                        const SizedBox(
                          height: 300,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: secondaryColor,
                            strokeWidth: 5,
                          ),
                        ),
                      ],
                    ),
                  )
                : status == HirePageStatus.noData
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        child: const Center(
                          child: Text('NO Data'),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        child: const Center(
                          child: Text("Something Wrong Happend"),
                        ),
                      ));
  }
}
