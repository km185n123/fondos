// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionDTO {

 String get id; String get type; double get amount;@JsonKey(name: 'fund_id') String get fundId; DateTime get date;@JsonKey(name: 'sync_status') String get syncStatus;
/// Create a copy of TransactionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDTOCopyWith<TransactionDTO> get copyWith => _$TransactionDTOCopyWithImpl<TransactionDTO>(this as TransactionDTO, _$identity);

  /// Serializes this TransactionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.date, date) || other.date == date)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,fundId,date,syncStatus);

@override
String toString() {
  return 'TransactionDTO(id: $id, type: $type, amount: $amount, fundId: $fundId, date: $date, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $TransactionDTOCopyWith<$Res>  {
  factory $TransactionDTOCopyWith(TransactionDTO value, $Res Function(TransactionDTO) _then) = _$TransactionDTOCopyWithImpl;
@useResult
$Res call({
 String id, String type, double amount,@JsonKey(name: 'fund_id') String fundId, DateTime date,@JsonKey(name: 'sync_status') String syncStatus
});




}
/// @nodoc
class _$TransactionDTOCopyWithImpl<$Res>
    implements $TransactionDTOCopyWith<$Res> {
  _$TransactionDTOCopyWithImpl(this._self, this._then);

  final TransactionDTO _self;
  final $Res Function(TransactionDTO) _then;

/// Create a copy of TransactionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? fundId = null,Object? date = null,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionDTO].
extension TransactionDTOPatterns on TransactionDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDTO value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  double amount, @JsonKey(name: 'fund_id')  String fundId,  DateTime date, @JsonKey(name: 'sync_status')  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDTO() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  double amount, @JsonKey(name: 'fund_id')  String fundId,  DateTime date, @JsonKey(name: 'sync_status')  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _TransactionDTO():
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  double amount, @JsonKey(name: 'fund_id')  String fundId,  DateTime date, @JsonKey(name: 'sync_status')  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDTO() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDTO extends TransactionDTO {
  const _TransactionDTO({required this.id, required this.type, required this.amount, @JsonKey(name: 'fund_id') required this.fundId, required this.date, @JsonKey(name: 'sync_status') required this.syncStatus}): super._();
  factory _TransactionDTO.fromJson(Map<String, dynamic> json) => _$TransactionDTOFromJson(json);

@override final  String id;
@override final  String type;
@override final  double amount;
@override@JsonKey(name: 'fund_id') final  String fundId;
@override final  DateTime date;
@override@JsonKey(name: 'sync_status') final  String syncStatus;

/// Create a copy of TransactionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDTOCopyWith<_TransactionDTO> get copyWith => __$TransactionDTOCopyWithImpl<_TransactionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.date, date) || other.date == date)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,fundId,date,syncStatus);

@override
String toString() {
  return 'TransactionDTO(id: $id, type: $type, amount: $amount, fundId: $fundId, date: $date, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$TransactionDTOCopyWith<$Res> implements $TransactionDTOCopyWith<$Res> {
  factory _$TransactionDTOCopyWith(_TransactionDTO value, $Res Function(_TransactionDTO) _then) = __$TransactionDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, double amount,@JsonKey(name: 'fund_id') String fundId, DateTime date,@JsonKey(name: 'sync_status') String syncStatus
});




}
/// @nodoc
class __$TransactionDTOCopyWithImpl<$Res>
    implements _$TransactionDTOCopyWith<$Res> {
  __$TransactionDTOCopyWithImpl(this._self, this._then);

  final _TransactionDTO _self;
  final $Res Function(_TransactionDTO) _then;

/// Create a copy of TransactionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? fundId = null,Object? date = null,Object? syncStatus = null,}) {
  return _then(_TransactionDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
