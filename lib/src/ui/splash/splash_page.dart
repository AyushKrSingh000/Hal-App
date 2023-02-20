import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/repositories/app_repository/app_repository.dart';
import '../../routing/router.gr.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appRepositoryProvider, (previous, next) async {
      if (next.status != previous?.status) {
        final router = context.router;
        switch (next.status) {
          case AppStatus.initial:
            // do nothing
            break;
          case AppStatus.unauthenticated:
            // navigate to auth after a delay
            await Future.delayed(const Duration(milliseconds: 2000));
            router.replace(const AuthRoute());
            break;
          case AppStatus.authenticatedNoProfile:
            // navigate to create profile after a delay
            await Future.delayed(const Duration(milliseconds: 2000));
            router.replace(MainRoute());
            break;
          case AppStatus.authenticatedHasProfile:
            // navigate to main after a delay
            await Future.delayed(const Duration(milliseconds: 2000));
            router.replace(MainRoute());
            break;
        }
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 300,
              width: 300,
            ),
            // Text(
            //   'HAL-Machinery',
            //   style: GoogleFonts.nunito(
            //     fontSize: 40,
            //     fontWeight: FontWeight.bold,
            //     color: const Color.fromARGB(255, 49, 71, 89),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
