// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Fund {

 String get id; String get nombre; double get montoMinimo; String get categoria;
/// Create a copy of Fund
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundCopyWith<Fund> get copyWith => _$FundCopyWithImpl<Fund>(this as Fund, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fund&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.montoMinimo, montoMinimo) || other.montoMinimo == montoMinimo)&&(identical(other.categoria, categoria) || other.categoria == categoria));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,montoMinimo,categoria);

@override
String toString() {
  return 'Fund(id: $id, nombre: $nombre, montoMinimo: $montoMinimo, categoria: $categoria)';
}


}

/// @nodoc
abstract mixin class $FundCopyWith<$Res>  {
  factory $FundCopyWith(Fund value, $Res Function(Fund) _then) = _$FundCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, double montoMinimo, String categoria
});




}
/// @nodoc
class _$FundCopyWithImpl<$Res>
    implements $FundCopyWith<$Res> {
  _$FundCopyWithImpl(this._self, this._then);

  final Fund _self;
  final $Res Function(Fund) _then;

/// Create a copy of Fund
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? montoMinimo = null,Object? categoria = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,montoMinimo: null == montoMinimo ? _self.montoMinimo : montoMinimo // ignore: cast_nullable_to_non_nullable
as double,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Fund].
extension FundPatterns on Fund {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fund value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fund() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fund value)  $default,){
final _that = this;
switch (_that) {
case _Fund():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fund value)?  $default,){
final _that = this;
switch (_that) {
case _Fund() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  double montoMinimo,  String categoria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fund() when $default != null:
return $default(_that.id,_that.nombre,_that.montoMinimo,_that.categoria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  double montoMinimo,  String categoria)  $default,) {final _that = this;
switch (_that) {
case _Fund():
return $default(_that.id,_that.nombre,_that.montoMinimo,_that.categoria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  double montoMinimo,  String categoria)?  $default,) {final _that = this;
switch (_that) {
case _Fund() when $default != null:
return $default(_that.id,_that.nombre,_that.montoMinimo,_that.categoria);case _:
  return null;

}
}

}

/// @nodoc


class _Fund implements Fund {
  const _Fund({required this.id, required this.nombre, required this.montoMinimo, required this.categoria});
  

@override final  String id;
@override final  String nombre;
@override final  double montoMinimo;
@override final  String categoria;

/// Create a copy of Fund
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundCopyWith<_Fund> get copyWith => __$FundCopyWithImpl<_Fund>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fund&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.montoMinimo, montoMinimo) || other.montoMinimo == montoMinimo)&&(identical(other.categoria, categoria) || other.categoria == categoria));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,montoMinimo,categoria);

@override
String toString() {
  return 'Fund(id: $id, nombre: $nombre, montoMinimo: $montoMinimo, categoria: $categoria)';
}


}

/// @nodoc
abstract mixin class _$FundCopyWith<$Res> implements $FundCopyWith<$Res> {
  factory _$FundCopyWith(_Fund value, $Res Function(_Fund) _then) = __$FundCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, double montoMinimo, String categoria
});




}
/// @nodoc
class __$FundCopyWithImpl<$Res>
    implements _$FundCopyWith<$Res> {
  __$FundCopyWithImpl(this._self, this._then);

  final _Fund _self;
  final $Res Function(_Fund) _then;

/// Create a copy of Fund
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? montoMinimo = null,Object? categoria = null,}) {
  return _then(_Fund(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,montoMinimo: null == montoMinimo ? _self.montoMinimo : montoMinimo // ignore: cast_nullable_to_non_nullable
as double,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
