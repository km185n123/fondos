// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryDto {

 String get title; String get amount; bool get isPositive;
/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDtoCopyWith<HistoryDto> get copyWith => _$HistoryDtoCopyWithImpl<HistoryDto>(this as HistoryDto, _$identity);

  /// Serializes this HistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDto&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isPositive, isPositive) || other.isPositive == isPositive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,amount,isPositive);

@override
String toString() {
  return 'HistoryDto(title: $title, amount: $amount, isPositive: $isPositive)';
}


}

/// @nodoc
abstract mixin class $HistoryDtoCopyWith<$Res>  {
  factory $HistoryDtoCopyWith(HistoryDto value, $Res Function(HistoryDto) _then) = _$HistoryDtoCopyWithImpl;
@useResult
$Res call({
 String title, String amount, bool isPositive
});




}
/// @nodoc
class _$HistoryDtoCopyWithImpl<$Res>
    implements $HistoryDtoCopyWith<$Res> {
  _$HistoryDtoCopyWithImpl(this._self, this._then);

  final HistoryDto _self;
  final $Res Function(HistoryDto) _then;

/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? amount = null,Object? isPositive = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,isPositive: null == isPositive ? _self.isPositive : isPositive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryDto].
extension HistoryDtoPatterns on HistoryDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryDto value)  $default,){
final _that = this;
switch (_that) {
case _HistoryDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String amount,  bool isPositive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that.title,_that.amount,_that.isPositive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String amount,  bool isPositive)  $default,) {final _that = this;
switch (_that) {
case _HistoryDto():
return $default(_that.title,_that.amount,_that.isPositive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String amount,  bool isPositive)?  $default,) {final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that.title,_that.amount,_that.isPositive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryDto implements HistoryDto {
  const _HistoryDto({required this.title, required this.amount, required this.isPositive});
  factory _HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);

@override final  String title;
@override final  String amount;
@override final  bool isPositive;

/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDtoCopyWith<_HistoryDto> get copyWith => __$HistoryDtoCopyWithImpl<_HistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryDto&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isPositive, isPositive) || other.isPositive == isPositive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,amount,isPositive);

@override
String toString() {
  return 'HistoryDto(title: $title, amount: $amount, isPositive: $isPositive)';
}


}

/// @nodoc
abstract mixin class _$HistoryDtoCopyWith<$Res> implements $HistoryDtoCopyWith<$Res> {
  factory _$HistoryDtoCopyWith(_HistoryDto value, $Res Function(_HistoryDto) _then) = __$HistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String amount, bool isPositive
});




}
/// @nodoc
class __$HistoryDtoCopyWithImpl<$Res>
    implements _$HistoryDtoCopyWith<$Res> {
  __$HistoryDtoCopyWithImpl(this._self, this._then);

  final _HistoryDto _self;
  final $Res Function(_HistoryDto) _then;

/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? amount = null,Object? isPositive = null,}) {
  return _then(_HistoryDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,isPositive: null == isPositive ? _self.isPositive : isPositive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
