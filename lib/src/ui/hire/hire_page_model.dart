import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hal/src/logic/services/firebase_firestore.dart';
import 'package:hal/src/models/item_data.dart';

part 'hire_page_model.freezed.dart';

final hirePageModelProvider =
    StateNotifierProvider.autoDispose<HirePageModel, HirePageState>(
  (ref) =>
      HirePageModel(firebaseFirestore: ref.watch(firebaseFirestoreProvider)),
);

class HirePageModel extends StateNotifier<HirePageState> {
  final FirebaseFirestore firebaseFirestore;
  late final StreamSubscription _subscription;

  HirePageModel({required this.firebaseFirestore})
      : super(const HirePageState()) {
    try {
      _subscription = firebaseFirestore
          .collection('equipments')
          .snapshots()
          .listen((querySnapshot) async {
        if (querySnapshot.size == 0) {
          state = state.copyWith(status: HirePageStatus.noData);
        } else {
          debugPrint(" item data exista");
          final dms = querySnapshot.docs
              .map(
                (doc) => ItemData.fromJson(
                  doc.data(),
                ),
              )
              .toList();
          await Future.delayed(const Duration(seconds: 1));
          state = state.copyWith(data: dms, status: HirePageStatus.dataLoaded);
        }
      });
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString(), status: HirePageStatus.error);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _subscription.cancel();
  }
}

@freezed
class HirePageState with _$HirePageState {
  const factory HirePageState({
    @Default(HirePageStatus.initial) HirePageStatus status,
    List<ItemData>? data,
    String? errorMessage,
  }) = _HirePageState;
}

enum HirePageStatus {
  initial,
  dataLoaded,
  noData,
  error,
}
