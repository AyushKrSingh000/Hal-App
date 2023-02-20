import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/router.gr.dart';
import '../widgets/bottom_bar.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      animationCurve: Curves.bounceInOut,
      routes: const [
        HomeTab(),
        RentTab(),
        HireTab(),
        ProfileTab(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomBar(
        key: ValueKey(tabsRouter.activeIndex),
      ),
    );
  }
}
