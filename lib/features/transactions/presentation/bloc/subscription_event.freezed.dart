// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent()';
}


}

/// @nodoc
class $SubscriptionEventCopyWith<$Res>  {
$SubscriptionEventCopyWith(SubscriptionEvent _, $Res Function(SubscriptionEvent) __);
}


/// Adds pattern-matching-related methods to [SubscriptionEvent].
extension SubscriptionEventPatterns on SubscriptionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SelectFund value)?  selectFund,TResult Function( _ChangeAmount value)?  changeAmount,TResult Function( _ChangeNotificationMethod value)?  changeNotificationMethod,TResult Function( _Confirm value)?  confirm,TResult Function( _Cancel value)?  cancel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectFund() when selectFund != null:
return selectFund(_that);case _ChangeAmount() when changeAmount != null:
return changeAmount(_that);case _ChangeNotificationMethod() when changeNotificationMethod != null:
return changeNotificationMethod(_that);case _Confirm() when confirm != null:
return confirm(_that);case _Cancel() when cancel != null:
return cancel(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SelectFund value)  selectFund,required TResult Function( _ChangeAmount value)  changeAmount,required TResult Function( _ChangeNotificationMethod value)  changeNotificationMethod,required TResult Function( _Confirm value)  confirm,required TResult Function( _Cancel value)  cancel,}){
final _that = this;
switch (_that) {
case _SelectFund():
return selectFund(_that);case _ChangeAmount():
return changeAmount(_that);case _ChangeNotificationMethod():
return changeNotificationMethod(_that);case _Confirm():
return confirm(_that);case _Cancel():
return cancel(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SelectFund value)?  selectFund,TResult? Function( _ChangeAmount value)?  changeAmount,TResult? Function( _ChangeNotificationMethod value)?  changeNotificationMethod,TResult? Function( _Confirm value)?  confirm,TResult? Function( _Cancel value)?  cancel,}){
final _that = this;
switch (_that) {
case _SelectFund() when selectFund != null:
return selectFund(_that);case _ChangeAmount() when changeAmount != null:
return changeAmount(_that);case _ChangeNotificationMethod() when changeNotificationMethod != null:
return changeNotificationMethod(_that);case _Confirm() when confirm != null:
return confirm(_that);case _Cancel() when cancel != null:
return cancel(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Fund fund)?  selectFund,TResult Function( double amount)?  changeAmount,TResult Function( NotificationMethod method)?  changeNotificationMethod,TResult Function()?  confirm,TResult Function( Transaction transaction)?  cancel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectFund() when selectFund != null:
return selectFund(_that.fund);case _ChangeAmount() when changeAmount != null:
return changeAmount(_that.amount);case _ChangeNotificationMethod() when changeNotificationMethod != null:
return changeNotificationMethod(_that.method);case _Confirm() when confirm != null:
return confirm();case _Cancel() when cancel != null:
return cancel(_that.transaction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Fund fund)  selectFund,required TResult Function( double amount)  changeAmount,required TResult Function( NotificationMethod method)  changeNotificationMethod,required TResult Function()  confirm,required TResult Function( Transaction transaction)  cancel,}) {final _that = this;
switch (_that) {
case _SelectFund():
return selectFund(_that.fund);case _ChangeAmount():
return changeAmount(_that.amount);case _ChangeNotificationMethod():
return changeNotificationMethod(_that.method);case _Confirm():
return confirm();case _Cancel():
return cancel(_that.transaction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Fund fund)?  selectFund,TResult? Function( double amount)?  changeAmount,TResult? Function( NotificationMethod method)?  changeNotificationMethod,TResult? Function()?  confirm,TResult? Function( Transaction transaction)?  cancel,}) {final _that = this;
switch (_that) {
case _SelectFund() when selectFund != null:
return selectFund(_that.fund);case _ChangeAmount() when changeAmount != null:
return changeAmount(_that.amount);case _ChangeNotificationMethod() when changeNotificationMethod != null:
return changeNotificationMethod(_that.method);case _Confirm() when confirm != null:
return confirm();case _Cancel() when cancel != null:
return cancel(_that.transaction);case _:
  return null;

}
}

}

/// @nodoc


class _SelectFund implements SubscriptionEvent {
  const _SelectFund(this.fund);
  

 final  Fund fund;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectFundCopyWith<_SelectFund> get copyWith => __$SelectFundCopyWithImpl<_SelectFund>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectFund&&(identical(other.fund, fund) || other.fund == fund));
}


@override
int get hashCode => Object.hash(runtimeType,fund);

@override
String toString() {
  return 'SubscriptionEvent.selectFund(fund: $fund)';
}


}

/// @nodoc
abstract mixin class _$SelectFundCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory _$SelectFundCopyWith(_SelectFund value, $Res Function(_SelectFund) _then) = __$SelectFundCopyWithImpl;
@useResult
$Res call({
 Fund fund
});


$FundCopyWith<$Res> get fund;

}
/// @nodoc
class __$SelectFundCopyWithImpl<$Res>
    implements _$SelectFundCopyWith<$Res> {
  __$SelectFundCopyWithImpl(this._self, this._then);

  final _SelectFund _self;
  final $Res Function(_SelectFund) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fund = null,}) {
  return _then(_SelectFund(
null == fund ? _self.fund : fund // ignore: cast_nullable_to_non_nullable
as Fund,
  ));
}

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundCopyWith<$Res> get fund {
  
  return $FundCopyWith<$Res>(_self.fund, (value) {
    return _then(_self.copyWith(fund: value));
  });
}
}

/// @nodoc


class _ChangeAmount implements SubscriptionEvent {
  const _ChangeAmount(this.amount);
  

 final  double amount;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeAmountCopyWith<_ChangeAmount> get copyWith => __$ChangeAmountCopyWithImpl<_ChangeAmount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAmount&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'SubscriptionEvent.changeAmount(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$ChangeAmountCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory _$ChangeAmountCopyWith(_ChangeAmount value, $Res Function(_ChangeAmount) _then) = __$ChangeAmountCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class __$ChangeAmountCopyWithImpl<$Res>
    implements _$ChangeAmountCopyWith<$Res> {
  __$ChangeAmountCopyWithImpl(this._self, this._then);

  final _ChangeAmount _self;
  final $Res Function(_ChangeAmount) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_ChangeAmount(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _ChangeNotificationMethod implements SubscriptionEvent {
  const _ChangeNotificationMethod(this.method);
  

 final  NotificationMethod method;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeNotificationMethodCopyWith<_ChangeNotificationMethod> get copyWith => __$ChangeNotificationMethodCopyWithImpl<_ChangeNotificationMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeNotificationMethod&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'SubscriptionEvent.changeNotificationMethod(method: $method)';
}


}

/// @nodoc
abstract mixin class _$ChangeNotificationMethodCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory _$ChangeNotificationMethodCopyWith(_ChangeNotificationMethod value, $Res Function(_ChangeNotificationMethod) _then) = __$ChangeNotificationMethodCopyWithImpl;
@useResult
$Res call({
 NotificationMethod method
});




}
/// @nodoc
class __$ChangeNotificationMethodCopyWithImpl<$Res>
    implements _$ChangeNotificationMethodCopyWith<$Res> {
  __$ChangeNotificationMethodCopyWithImpl(this._self, this._then);

  final _ChangeNotificationMethod _self;
  final $Res Function(_ChangeNotificationMethod) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_ChangeNotificationMethod(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as NotificationMethod,
  ));
}


}

/// @nodoc


class _Confirm implements SubscriptionEvent {
  const _Confirm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Confirm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent.confirm()';
}


}




/// @nodoc


class _Cancel implements SubscriptionEvent {
  const _Cancel(this.transaction);
  

 final  Transaction transaction;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelCopyWith<_Cancel> get copyWith => __$CancelCopyWithImpl<_Cancel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancel&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'SubscriptionEvent.cancel(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class _$CancelCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory _$CancelCopyWith(_Cancel value, $Res Function(_Cancel) _then) = __$CancelCopyWithImpl;
@useResult
$Res call({
 Transaction transaction
});


$TransactionCopyWith<$Res> get transaction;

}
/// @nodoc
class __$CancelCopyWithImpl<$Res>
    implements _$CancelCopyWith<$Res> {
  __$CancelCopyWithImpl(this._self, this._then);

  final _Cancel _self;
  final $Res Function(_Cancel) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(_Cancel(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}

// dart format on
