// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData(
      cost: (json['cost'] as num).toDouble(),
      date: json['date'] as String,
      brandName: json['brand_name'] as String,
      condition: (json['condition'] as num).toDouble(),
      discription: json['discription'] as String,
      itemId: json['equipment_id'] as String?,
      lenderId: json['lender_id'] as String?,
      location: json['location'] as String,
      modelName: json['model_name'] as String,
      power: json['power'] as int,
      rc: json['rc'] as bool,
      rtono: json['rtono'] as String,
      status: json['status'] as bool,
      year: json['year'] as String,
    );

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'equipment_id': instance.itemId,
      'brand_name': instance.brandName,
      'condition': instance.condition,
      'discription': instance.discription,
      'lender_id': instance.lenderId,
      'location': instance.location,
      'model_name': instance.modelName,
      'power': instance.power,
      'rc': instance.rc,
      'rtono': instance.rtono,
      'status': instance.status,
      'year': instance.year,
      'date': instance.date,
      'cost': instance.cost,
    };
