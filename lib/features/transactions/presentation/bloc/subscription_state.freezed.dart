// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionState {

 SubscriptionStatus get status; Fund? get selectedFund; double get amount; double get availableBalance; NotificationMethod get notificationMethod; String? get errorMessage; String? get amountError;
/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionStateCopyWith<SubscriptionState> get copyWith => _$SubscriptionStateCopyWithImpl<SubscriptionState>(this as SubscriptionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedFund, selectedFund) || other.selectedFund == selectedFund)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.notificationMethod, notificationMethod) || other.notificationMethod == notificationMethod)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.amountError, amountError) || other.amountError == amountError));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedFund,amount,availableBalance,notificationMethod,errorMessage,amountError);

@override
String toString() {
  return 'SubscriptionState(status: $status, selectedFund: $selectedFund, amount: $amount, availableBalance: $availableBalance, notificationMethod: $notificationMethod, errorMessage: $errorMessage, amountError: $amountError)';
}


}

/// @nodoc
abstract mixin class $SubscriptionStateCopyWith<$Res>  {
  factory $SubscriptionStateCopyWith(SubscriptionState value, $Res Function(SubscriptionState) _then) = _$SubscriptionStateCopyWithImpl;
@useResult
$Res call({
 SubscriptionStatus status, Fund? selectedFund, double amount, double availableBalance, NotificationMethod notificationMethod, String? errorMessage, String? amountError
});


$FundCopyWith<$Res>? get selectedFund;

}
/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._self, this._then);

  final SubscriptionState _self;
  final $Res Function(SubscriptionState) _then;

/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? selectedFund = freezed,Object? amount = null,Object? availableBalance = null,Object? notificationMethod = null,Object? errorMessage = freezed,Object? amountError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,selectedFund: freezed == selectedFund ? _self.selectedFund : selectedFund // ignore: cast_nullable_to_non_nullable
as Fund?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,notificationMethod: null == notificationMethod ? _self.notificationMethod : notificationMethod // ignore: cast_nullable_to_non_nullable
as NotificationMethod,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,amountError: freezed == amountError ? _self.amountError : amountError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundCopyWith<$Res>? get selectedFund {
    if (_self.selectedFund == null) {
    return null;
  }

  return $FundCopyWith<$Res>(_self.selectedFund!, (value) {
    return _then(_self.copyWith(selectedFund: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubscriptionState].
extension SubscriptionStatePatterns on SubscriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionState value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionState value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionStatus status,  Fund? selectedFund,  double amount,  double availableBalance,  NotificationMethod notificationMethod,  String? errorMessage,  String? amountError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionState() when $default != null:
return $default(_that.status,_that.selectedFund,_that.amount,_that.availableBalance,_that.notificationMethod,_that.errorMessage,_that.amountError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionStatus status,  Fund? selectedFund,  double amount,  double availableBalance,  NotificationMethod notificationMethod,  String? errorMessage,  String? amountError)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionState():
return $default(_that.status,_that.selectedFund,_that.amount,_that.availableBalance,_that.notificationMethod,_that.errorMessage,_that.amountError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionStatus status,  Fund? selectedFund,  double amount,  double availableBalance,  NotificationMethod notificationMethod,  String? errorMessage,  String? amountError)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionState() when $default != null:
return $default(_that.status,_that.selectedFund,_that.amount,_that.availableBalance,_that.notificationMethod,_that.errorMessage,_that.amountError);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionState implements SubscriptionState {
  const _SubscriptionState({this.status = SubscriptionStatus.initial, this.selectedFund, this.amount = 0.0, this.availableBalance = 12450000.0, this.notificationMethod = NotificationMethod.email, this.errorMessage, this.amountError});
  

@override@JsonKey() final  SubscriptionStatus status;
@override final  Fund? selectedFund;
@override@JsonKey() final  double amount;
@override@JsonKey() final  double availableBalance;
@override@JsonKey() final  NotificationMethod notificationMethod;
@override final  String? errorMessage;
@override final  String? amountError;

/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionStateCopyWith<_SubscriptionState> get copyWith => __$SubscriptionStateCopyWithImpl<_SubscriptionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedFund, selectedFund) || other.selectedFund == selectedFund)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.notificationMethod, notificationMethod) || other.notificationMethod == notificationMethod)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.amountError, amountError) || other.amountError == amountError));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedFund,amount,availableBalance,notificationMethod,errorMessage,amountError);

@override
String toString() {
  return 'SubscriptionState(status: $status, selectedFund: $selectedFund, amount: $amount, availableBalance: $availableBalance, notificationMethod: $notificationMethod, errorMessage: $errorMessage, amountError: $amountError)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionStateCopyWith<$Res> implements $SubscriptionStateCopyWith<$Res> {
  factory _$SubscriptionStateCopyWith(_SubscriptionState value, $Res Function(_SubscriptionState) _then) = __$SubscriptionStateCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionStatus status, Fund? selectedFund, double amount, double availableBalance, NotificationMethod notificationMethod, String? errorMessage, String? amountError
});


@override $FundCopyWith<$Res>? get selectedFund;

}
/// @nodoc
class __$SubscriptionStateCopyWithImpl<$Res>
    implements _$SubscriptionStateCopyWith<$Res> {
  __$SubscriptionStateCopyWithImpl(this._self, this._then);

  final _SubscriptionState _self;
  final $Res Function(_SubscriptionState) _then;

/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? selectedFund = freezed,Object? amount = null,Object? availableBalance = null,Object? notificationMethod = null,Object? errorMessage = freezed,Object? amountError = freezed,}) {
  return _then(_SubscriptionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,selectedFund: freezed == selectedFund ? _self.selectedFund : selectedFund // ignore: cast_nullable_to_non_nullable
as Fund?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,notificationMethod: null == notificationMethod ? _self.notificationMethod : notificationMethod // ignore: cast_nullable_to_non_nullable
as NotificationMethod,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,amountError: freezed == amountError ? _self.amountError : amountError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundCopyWith<$Res>? get selectedFund {
    if (_self.selectedFund == null) {
    return null;
  }

  return $FundCopyWith<$Res>(_self.selectedFund!, (value) {
    return _then(_self.copyWith(selectedFund: value));
  });
}
}

// dart format on
