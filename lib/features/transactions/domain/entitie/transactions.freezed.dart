// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transactions {

 String get id; TransactionType get type; double get amount; String get fundId; DateTime get date;
/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCopyWith<Transactions> get copyWith => _$TransactionsCopyWithImpl<Transactions>(this as Transactions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transactions&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,amount,fundId,date);

@override
String toString() {
  return 'Transactions(id: $id, type: $type, amount: $amount, fundId: $fundId, date: $date)';
}


}

/// @nodoc
abstract mixin class $TransactionsCopyWith<$Res>  {
  factory $TransactionsCopyWith(Transactions value, $Res Function(Transactions) _then) = _$TransactionsCopyWithImpl;
@useResult
$Res call({
 String id, TransactionType type, double amount, String fundId, DateTime date
});




}
/// @nodoc
class _$TransactionsCopyWithImpl<$Res>
    implements $TransactionsCopyWith<$Res> {
  _$TransactionsCopyWithImpl(this._self, this._then);

  final Transactions _self;
  final $Res Function(Transactions) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? fundId = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Transactions].
extension TransactionsPatterns on Transactions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transactions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transactions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transactions value)  $default,){
final _that = this;
switch (_that) {
case _Transactions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transactions value)?  $default,){
final _that = this;
switch (_that) {
case _Transactions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TransactionType type,  double amount,  String fundId,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transactions() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TransactionType type,  double amount,  String fundId,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _Transactions():
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TransactionType type,  double amount,  String fundId,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _Transactions() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.fundId,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _Transactions implements Transactions {
  const _Transactions({required this.id, required this.type, required this.amount, required this.fundId, required this.date});
  

@override final  String id;
@override final  TransactionType type;
@override final  double amount;
@override final  String fundId;
@override final  DateTime date;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsCopyWith<_Transactions> get copyWith => __$TransactionsCopyWithImpl<_Transactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transactions&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,amount,fundId,date);

@override
String toString() {
  return 'Transactions(id: $id, type: $type, amount: $amount, fundId: $fundId, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TransactionsCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory _$TransactionsCopyWith(_Transactions value, $Res Function(_Transactions) _then) = __$TransactionsCopyWithImpl;
@override @useResult
$Res call({
 String id, TransactionType type, double amount, String fundId, DateTime date
});




}
/// @nodoc
class __$TransactionsCopyWithImpl<$Res>
    implements _$TransactionsCopyWith<$Res> {
  __$TransactionsCopyWithImpl(this._self, this._then);

  final _Transactions _self;
  final $Res Function(_Transactions) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? fundId = null,Object? date = null,}) {
  return _then(_Transactions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
