import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_data.g.dart';

@JsonSerializable()
class ItemData {
  @JsonKey(name: 'equipment_id')
  final String? itemId;
  @JsonKey(name: 'brand_name')
  final String brandName; //
  final double condition; //
  final String discription; //
  @JsonKey(name: 'lender_id')
  final String? lenderId; //
  final String location; //
  @JsonKey(name: 'model_name')
  final String modelName; //
  final int power; //
  final bool rc; //
  final String rtono; //
  final bool status; //
  final String year; //
  final String date;
  final double cost;
  const ItemData({
    required this.cost,
    required this.date,
    required this.brandName,
    required this.condition,
    required this.discription,
    this.itemId,
    this.lenderId,
    required this.location,
    required this.modelName,
    required this.power,
    required this.rc,
    required this.rtono,
    required this.status,
    required this.year,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);
}
