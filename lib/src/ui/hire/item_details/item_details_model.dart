import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hal/src/logic/services/firebase_firestore.dart';
import 'package:hal/src/models/item_data.dart';
part 'item_details_model.freezed.dart';

final itemDetailsProvider =
    StateNotifierProvider.autoDispose<DetailsPageModel, DetailsPageState>(
  (ref) =>
      DetailsPageModel(firebaseFirestore: ref.watch(firebaseFirestoreProvider)),
);

class DetailsPageModel extends StateNotifier<DetailsPageState> {
  final FirebaseFirestore firebaseFirestore;

  DetailsPageModel({required this.firebaseFirestore})
      : super(const DetailsPageState());
  init(String itemId, ItemData itemData) async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
        status: DetailsStatus.loaded, itemId: itemId, data: itemData);
  }

  setFilterType(TabStatus status) {
    state = state.copyWith(filter: status);
  }
}

@freezed
class DetailsPageState with _$DetailsPageState {
  const factory DetailsPageState({
    @Default(DetailsStatus.initial) DetailsStatus status,
    @Default(TabStatus.itemDetails) TabStatus filter,
    ItemData? data,
    @Default('') itemId,
    String? errorMessage,
  }) = _DetailsPageState;
}

enum DetailsStatus {
  initial,
  loaded,

  error,
}

enum TabStatus {
  itemDetails,
  lenderDetails,
}
