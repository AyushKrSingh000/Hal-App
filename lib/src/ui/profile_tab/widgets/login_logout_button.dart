// import 'package:auto_route/auto_route.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hal/src/ui/auth/auth_page_model.dart';

// import '../../../routing/router.gr.dart';

// class LoginLogoutButton extends ConsumerWidget {
//   const LoginLogoutButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authStatus = ref.watch(authPageModelProvider.select((_) => _.status));
//     return InkWell(
//       onTap: () => authStatus == AuthPageStatus.authenticated
//           ? null
//           : context.navigateTo(const AuthRoute()),
//       child: Container(
//         height: 55,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             width: 1,
//             color: const Color(0xFF777777),
//           ),
//         ),
//         margin: const EdgeInsets.symmetric(horizontal: 25),
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         width: double.infinity,
//         child: Center(
//           child: Text(
//             authStatus == AuthPageStatus.authenticated ? 'LOGOUT' : 'LOGIN',
//             style: GoogleFonts.plusJakartaSans(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xFFFFFFFF),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
