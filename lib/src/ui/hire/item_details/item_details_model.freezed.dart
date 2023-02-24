// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsPageState {
  DetailsStatus get status => throw _privateConstructorUsedError;
  TabStatus get filter => throw _privateConstructorUsedError;
  ItemData? get data => throw _privateConstructorUsedError;
  dynamic get itemId => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsPageStateCopyWith<DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPageStateCopyWith<$Res> {
  factory $DetailsPageStateCopyWith(
          DetailsPageState value, $Res Function(DetailsPageState) then) =
      _$DetailsPageStateCopyWithImpl<$Res, DetailsPageState>;
  @useResult
  $Res call(
      {DetailsStatus status,
      TabStatus filter,
      ItemData? data,
      dynamic itemId,
      String? errorMessage});
}

/// @nodoc
class _$DetailsPageStateCopyWithImpl<$Res, $Val extends DetailsPageState>
    implements $DetailsPageStateCopyWith<$Res> {
  _$DetailsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? filter = null,
    Object? data = freezed,
    Object? itemId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsStatus,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TabStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ItemData?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsPageStateCopyWith<$Res>
    implements $DetailsPageStateCopyWith<$Res> {
  factory _$$_DetailsPageStateCopyWith(
          _$_DetailsPageState value, $Res Function(_$_DetailsPageState) then) =
      __$$_DetailsPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetailsStatus status,
      TabStatus filter,
      ItemData? data,
      dynamic itemId,
      String? errorMessage});
}

/// @nodoc
class __$$_DetailsPageStateCopyWithImpl<$Res>
    extends _$DetailsPageStateCopyWithImpl<$Res, _$_DetailsPageState>
    implements _$$_DetailsPageStateCopyWith<$Res> {
  __$$_DetailsPageStateCopyWithImpl(
      _$_DetailsPageState _value, $Res Function(_$_DetailsPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? filter = null,
    Object? data = freezed,
    Object? itemId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_DetailsPageState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsStatus,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TabStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ItemData?,
      itemId: freezed == itemId ? _value.itemId! : itemId,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DetailsPageState implements _DetailsPageState {
  const _$_DetailsPageState(
      {this.status = DetailsStatus.initial,
      this.filter = TabStatus.itemDetails,
      this.data,
      this.itemId = '',
      this.errorMessage});

  @override
  @JsonKey()
  final DetailsStatus status;
  @override
  @JsonKey()
  final TabStatus filter;
  @override
  final ItemData? data;
  @override
  @JsonKey()
  final dynamic itemId;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DetailsPageState(status: $status, filter: $filter, data: $data, itemId: $itemId, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsPageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, filter, data,
      const DeepCollectionEquality().hash(itemId), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsPageStateCopyWith<_$_DetailsPageState> get copyWith =>
      __$$_DetailsPageStateCopyWithImpl<_$_DetailsPageState>(this, _$identity);
}

abstract class _DetailsPageState implements DetailsPageState {
  const factory _DetailsPageState(
      {final DetailsStatus status,
      final TabStatus filter,
      final ItemData? data,
      final dynamic itemId,
      final String? errorMessage}) = _$_DetailsPageState;

  @override
  DetailsStatus get status;
  @override
  TabStatus get filter;
  @override
  ItemData? get data;
  @override
  dynamic get itemId;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsPageStateCopyWith<_$_DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
