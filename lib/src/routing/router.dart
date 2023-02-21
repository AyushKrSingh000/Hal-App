import 'package:auto_route/auto_route.dart';

import 'package:hal/src/ui/rent/rent_page.dart';

import '../ui/auth/auth_page.dart';
import '../ui/hire/hire_page.dart';
import '../ui/home/home_page.dart';
import '../ui/main/main.dart';
import '../ui/profile_tab/account_tab.dart';
import '../ui/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashPage,
    ),
    AutoRoute(
      path: '/auth',
      page: AuthPage,
    ),
    AutoRoute(path: '/main', page: MainPage, children: [
      AutoRoute(
        path: 'home',
        page: HomeTab,
      ),
      AutoRoute(
        path: 'hire',
        page: HireTab,
      ),
      AutoRoute(
        path: 'rent',
        page: RentTab,
      ),
      AutoRoute(
        path: 'profile',
        page: ProfileTab,
      ),
    ]),
  ],
)
class $AppRouter {}
