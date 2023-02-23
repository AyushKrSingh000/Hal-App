import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';

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
          context.replaceRoute(const MainRoute());
        } else if (next.status == AppStatus.authenticatedNoProfile) {
          context.replaceRoute(const MainRoute());
        }
      }
    });
    ref.listen(authPageModelProvider, (previous, next) {
      if (next.status == AuthPageStatus.error) {}
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/userlogin.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.jpg',
                            height: 100,
                          ),
                          Text(
                            'Welcome Again',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Greetings! Enter your details to unlock the doorsof farmer-to-farmer rentals.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              onChanged: (value) {},
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Email',
                                  labelStyle: GoogleFonts.poppins(
                                      color: const Color(0XFF053245)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: Color(0XFF053245)),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              onChanged: (value) {},
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.poppins(
                                      color: const Color(0XFF053245)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: Color(0XFF053245)),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0XFF053245),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: const Size(double.infinity, 40)),
                              onPressed: () {},
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                'or',
                                style: GoogleFonts.poppins(
                                  color: primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0XFF053245)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: const Size(double.infinity, 40)),
                              onPressed: () {
                                ref
                                    .read(authPageModelProvider.notifier)
                                    .signin();
                              },
                              child: Text(
                                "Sign in With Google",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              )),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
