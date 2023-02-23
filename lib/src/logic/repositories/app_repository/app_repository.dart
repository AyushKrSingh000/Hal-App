import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user_data.dart';
import '../../services/firebase_auth.dart';
import '../../services/firebase_firestore.dart';
part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.read(firebaseAuthProvider),
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  late final StreamSubscription _authSubscription;
  StreamSubscription? _userDataSubscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  }) : super(const AppState()) {
    firebaseAuth.authStateChanges().listen((user) async {
      _userDataSubscription?.cancel();
      state = state.copyWith(
        authUser: user,
      );
      if (user == null) {
        debugPrint('user is null');
        state = state.copyWith(
          status: AppStatus.unauthenticated,
        );
      } else {
        debugPrint('user is not null');
        print(user.uid);
        _userDataSubscription = firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .snapshots()
            .listen((documentSnapshot) {
          if (documentSnapshot.exists) {
            debugPrint('user data exists');
            state = state.copyWith(
              userData: UserData.fromJson(documentSnapshot.data()!),
              status: AppStatus.authenticatedHasProfile,
            );
          } else {
            firebaseFirestore.collection('users').doc(user.uid).set({
              'userId': user.uid,
              'userName': user.displayName,
              'email': user.email,
              'profilePicUrl': user.photoURL
            });
            state = state.copyWith(
              status: AppStatus.authenticatedHasProfile,
            );
          }
        });
      }
    });
  }
  setFavourites(String itemId) async {
    final favourites = state.userData?.favourites ?? [];
    if (state.userData?.favourites?.contains(itemId) == false) {
      favourites.add(itemId);
    } else {
      favourites.remove(itemId);
    }
    await firebaseFirestore
        .collection('users')
        .doc(state.userData!.userId)
        .update({'favourites': favourites});
  }

  @override
  void dispose() {
    super.dispose();
    _authSubscription.cancel();
    _userDataSubscription?.cancel();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    @Default(null) UserData? userData,
    @Default(AppStatus.initial) AppStatus status,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticatedNoProfile,
  authenticatedHasProfile,
}
