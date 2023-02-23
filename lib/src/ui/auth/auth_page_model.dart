import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hal/src/logic/services/firebase_firestore.dart';
import '../../logic/services/firebase_auth.dart';

part 'auth_page_model.freezed.dart';

final authPageModelProvider =
    StateNotifierProvider.autoDispose<AuthPageModel, AuthPageState>(
  (ref) => AuthPageModel(
      firebaseAuth: ref.watch(firebaseAuthProvider),
      googleSignIn: ref.watch(googleAuthProvider),
      firebaseFirestore: ref.watch(firebaseFirestoreProvider)),
);

class AuthPageModel extends StateNotifier<AuthPageState> {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  AuthPageModel(
      {required this.firebaseAuth,
      required this.googleSignIn,
      required this.firebaseFirestore})
      : super(const AuthPageState());
  signin() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

@freezed
class AuthPageState with _$AuthPageState {
  const factory AuthPageState({
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    @Default(false) bool isTncAccepted,
    String? errorMessage,
  }) = _AuthPageState;
}

enum AuthPageStatus {
  initial,
  authenticated,
  error,
}
