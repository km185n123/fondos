// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionUiModel {

 String get title; String get amount; bool get isPositive;
/// Create a copy of TransactionUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionUiModelCopyWith<TransactionUiModel> get copyWith => _$TransactionUiModelCopyWithImpl<TransactionUiModel>(this as TransactionUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionUiModel&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isPositive, isPositive) || other.isPositive == isPositive));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,isPositive);

@override
String toString() {
  return 'TransactionUiModel(title: $title, amount: $amount, isPositive: $isPositive)';
}


}

/// @nodoc
abstract mixin class $TransactionUiModelCopyWith<$Res>  {
  factory $TransactionUiModelCopyWith(TransactionUiModel value, $Res Function(TransactionUiModel) _then) = _$TransactionUiModelCopyWithImpl;
@useResult
$Res call({
 String title, String amount, bool isPositive
});




}
/// @nodoc
class _$TransactionUiModelCopyWithImpl<$Res>
    implements $TransactionUiModelCopyWith<$Res> {
  _$TransactionUiModelCopyWithImpl(this._self, this._then);

  final TransactionUiModel _self;
  final $Res Function(TransactionUiModel) _then;

/// Create a copy of TransactionUiModel
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


/// Adds pattern-matching-related methods to [TransactionUiModel].
extension TransactionUiModelPatterns on TransactionUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionUiModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionUiModel() when $default != null:
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
case _TransactionUiModel() when $default != null:
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
case _TransactionUiModel():
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
case _TransactionUiModel() when $default != null:
return $default(_that.title,_that.amount,_that.isPositive);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionUiModel implements TransactionUiModel {
  const _TransactionUiModel({required this.title, required this.amount, required this.isPositive});
  

@override final  String title;
@override final  String amount;
@override final  bool isPositive;

/// Create a copy of TransactionUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionUiModelCopyWith<_TransactionUiModel> get copyWith => __$TransactionUiModelCopyWithImpl<_TransactionUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionUiModel&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isPositive, isPositive) || other.isPositive == isPositive));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,isPositive);

@override
String toString() {
  return 'TransactionUiModel(title: $title, amount: $amount, isPositive: $isPositive)';
}


}

/// @nodoc
abstract mixin class _$TransactionUiModelCopyWith<$Res> implements $TransactionUiModelCopyWith<$Res> {
  factory _$TransactionUiModelCopyWith(_TransactionUiModel value, $Res Function(_TransactionUiModel) _then) = __$TransactionUiModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String amount, bool isPositive
});




}
/// @nodoc
class __$TransactionUiModelCopyWithImpl<$Res>
    implements _$TransactionUiModelCopyWith<$Res> {
  __$TransactionUiModelCopyWithImpl(this._self, this._then);

  final _TransactionUiModel _self;
  final $Res Function(_TransactionUiModel) _then;

/// Create a copy of TransactionUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? amount = null,Object? isPositive = null,}) {
  return _then(_TransactionUiModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,isPositive: null == isPositive ? _self.isPositive : isPositive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
