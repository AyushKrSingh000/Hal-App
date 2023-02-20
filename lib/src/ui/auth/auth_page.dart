import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/repositories/app_repository/app_repository.dart';
import '../../routing/router.gr.dart';
import 'auth_page_model.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appRepositoryProvider, (previous, next) {
      if (next.status != previous?.status) {
        if (next.status == AppStatus.authenticatedHasProfile) {
          context.replaceRoute(MainRoute());
        } else if (next.status == AppStatus.authenticatedNoProfile) {
          context.replaceRoute(MainRoute());
        }
      }
    });
    ref.listen(authPageModelProvider, (previous, next) {
      if (next.status == AuthPageStatus.error) {}
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(authPageModelProvider.notifier).signin();
                },
                child: const Text('Login'),
              ),
            )),
      ),
    );
  }
}
