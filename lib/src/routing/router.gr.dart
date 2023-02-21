// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../ui/auth/auth_page.dart' as _i2;
import '../ui/hire/hire_page.dart' as _i5;
import '../ui/home/home_page.dart' as _i4;
import '../ui/main/main.dart' as _i3;
import '../ui/profile_tab/account_tab.dart' as _i7;
import '../ui/rent/rent_page.dart' as _i6;
import '../ui/splash/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeTab(),
      );
    },
    HireTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HireTab(),
      );
    },
    RentTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RentTab(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileTab(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          AuthRoute.name,
          path: '/auth',
        ),
        _i8.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i8.RouteConfig(
              HomeTab.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              HireTab.name,
              path: 'hire',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              RentTab.name,
              path: 'rent',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              ProfileTab.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.HomeTab]
class HomeTab extends _i8.PageRouteInfo<void> {
  const HomeTab()
      : super(
          HomeTab.name,
          path: 'home',
        );

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i5.HireTab]
class HireTab extends _i8.PageRouteInfo<void> {
  const HireTab()
      : super(
          HireTab.name,
          path: 'hire',
        );

  static const String name = 'HireTab';
}

/// generated route for
/// [_i6.RentTab]
class RentTab extends _i8.PageRouteInfo<void> {
  const RentTab()
      : super(
          RentTab.name,
          path: 'rent',
        );

  static const String name = 'RentTab';
}

/// generated route for
/// [_i7.ProfileTab]
class ProfileTab extends _i8.PageRouteInfo<void> {
  const ProfileTab()
      : super(
          ProfileTab.name,
          path: 'profile',
        );

  static const String name = 'ProfileTab';
}
