// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hire_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HirePageState {
  HirePageStatus get status => throw _privateConstructorUsedError;
  List<ItemData>? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HirePageStateCopyWith<HirePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HirePageStateCopyWith<$Res> {
  factory $HirePageStateCopyWith(
          HirePageState value, $Res Function(HirePageState) then) =
      _$HirePageStateCopyWithImpl<$Res, HirePageState>;
  @useResult
  $Res call(
      {HirePageStatus status, List<ItemData>? data, String? errorMessage});
}

/// @nodoc
class _$HirePageStateCopyWithImpl<$Res, $Val extends HirePageState>
    implements $HirePageStateCopyWith<$Res> {
  _$HirePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HirePageStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ItemData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HirePageStateCopyWith<$Res>
    implements $HirePageStateCopyWith<$Res> {
  factory _$$_HirePageStateCopyWith(
          _$_HirePageState value, $Res Function(_$_HirePageState) then) =
      __$$_HirePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HirePageStatus status, List<ItemData>? data, String? errorMessage});
}

/// @nodoc
class __$$_HirePageStateCopyWithImpl<$Res>
    extends _$HirePageStateCopyWithImpl<$Res, _$_HirePageState>
    implements _$$_HirePageStateCopyWith<$Res> {
  __$$_HirePageStateCopyWithImpl(
      _$_HirePageState _value, $Res Function(_$_HirePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_HirePageState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HirePageStatus,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ItemData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HirePageState implements _HirePageState {
  const _$_HirePageState(
      {this.status = HirePageStatus.initial,
      final List<ItemData>? data,
      this.errorMessage})
      : _data = data;

  @override
  @JsonKey()
  final HirePageStatus status;
  final List<ItemData>? _data;
  @override
  List<ItemData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HirePageState(status: $status, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HirePageState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_data), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HirePageStateCopyWith<_$_HirePageState> get copyWith =>
      __$$_HirePageStateCopyWithImpl<_$_HirePageState>(this, _$identity);
}

abstract class _HirePageState implements HirePageState {
  const factory _HirePageState(
      {final HirePageStatus status,
      final List<ItemData>? data,
      final String? errorMessage}) = _$_HirePageState;

  @override
  HirePageStatus get status;
  @override
  List<ItemData>? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_HirePageStateCopyWith<_$_HirePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
