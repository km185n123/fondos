// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investments_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvestmentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestmentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InvestmentsEvent()';
}


}

/// @nodoc
class $InvestmentsEventCopyWith<$Res>  {
$InvestmentsEventCopyWith(InvestmentsEvent _, $Res Function(InvestmentsEvent) __);
}


/// Adds pattern-matching-related methods to [InvestmentsEvent].
extension InvestmentsEventPatterns on InvestmentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartWatching value)?  startWatching,TResult Function( _OnData value)?  onData,TResult Function( _Cancel value)?  cancel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartWatching() when startWatching != null:
return startWatching(_that);case _OnData() when onData != null:
return onData(_that);case _Cancel() when cancel != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartWatching value)  startWatching,required TResult Function( _OnData value)  onData,required TResult Function( _Cancel value)  cancel,}){
final _that = this;
switch (_that) {
case _StartWatching():
return startWatching(_that);case _OnData():
return onData(_that);case _Cancel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartWatching value)?  startWatching,TResult? Function( _OnData value)?  onData,TResult? Function( _Cancel value)?  cancel,}){
final _that = this;
switch (_that) {
case _StartWatching() when startWatching != null:
return startWatching(_that);case _OnData() when onData != null:
return onData(_that);case _Cancel() when cancel != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startWatching,TResult Function( List<Transaction> data)?  onData,TResult Function( Transaction transaction)?  cancel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartWatching() when startWatching != null:
return startWatching();case _OnData() when onData != null:
return onData(_that.data);case _Cancel() when cancel != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startWatching,required TResult Function( List<Transaction> data)  onData,required TResult Function( Transaction transaction)  cancel,}) {final _that = this;
switch (_that) {
case _StartWatching():
return startWatching();case _OnData():
return onData(_that.data);case _Cancel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startWatching,TResult? Function( List<Transaction> data)?  onData,TResult? Function( Transaction transaction)?  cancel,}) {final _that = this;
switch (_that) {
case _StartWatching() when startWatching != null:
return startWatching();case _OnData() when onData != null:
return onData(_that.data);case _Cancel() when cancel != null:
return cancel(_that.transaction);case _:
  return null;

}
}

}

/// @nodoc


class _StartWatching implements InvestmentsEvent {
  const _StartWatching();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartWatching);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InvestmentsEvent.startWatching()';
}


}




/// @nodoc


class _OnData implements InvestmentsEvent {
  const _OnData(final  List<Transaction> data): _data = data;
  

 final  List<Transaction> _data;
 List<Transaction> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of InvestmentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnDataCopyWith<_OnData> get copyWith => __$OnDataCopyWithImpl<_OnData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnData&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'InvestmentsEvent.onData(data: $data)';
}


}

/// @nodoc
abstract mixin class _$OnDataCopyWith<$Res> implements $InvestmentsEventCopyWith<$Res> {
  factory _$OnDataCopyWith(_OnData value, $Res Function(_OnData) _then) = __$OnDataCopyWithImpl;
@useResult
$Res call({
 List<Transaction> data
});




}
/// @nodoc
class __$OnDataCopyWithImpl<$Res>
    implements _$OnDataCopyWith<$Res> {
  __$OnDataCopyWithImpl(this._self, this._then);

  final _OnData _self;
  final $Res Function(_OnData) _then;

/// Create a copy of InvestmentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_OnData(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Transaction>,
  ));
}


}

/// @nodoc


class _Cancel implements InvestmentsEvent {
  const _Cancel(this.transaction);
  

 final  Transaction transaction;

/// Create a copy of InvestmentsEvent
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
  return 'InvestmentsEvent.cancel(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class _$CancelCopyWith<$Res> implements $InvestmentsEventCopyWith<$Res> {
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

/// Create a copy of InvestmentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(_Cancel(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,
  ));
}

/// Create a copy of InvestmentsEvent
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
