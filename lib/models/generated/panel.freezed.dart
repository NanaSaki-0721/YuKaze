// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../panel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PanelPlan {

 int? get id; String? get name; String? get content;@JsonKey(name: 'transfer_enable') int? get transferEnable;@JsonKey(name: 'device_limit') int? get deviceLimit;@JsonKey(name: 'speed_limit') int? get speedLimit;@JsonKey(name: 'month_price') int? get monthPrice;@JsonKey(name: 'quarter_price') int? get quarterPrice;@JsonKey(name: 'half_year_price') int? get halfYearPrice;@JsonKey(name: 'year_price') int? get yearPrice;@JsonKey(name: 'two_year_price') int? get twoYearPrice;@JsonKey(name: 'three_year_price') int? get threeYearPrice;@JsonKey(name: 'onetime_price') int? get onetimePrice;@JsonKey(name: 'reset_price') int? get resetPrice; int? get show; int? get renew;@JsonKey(name: 'capacity_limit') int? get capacityLimit;
/// Create a copy of PanelPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelPlanCopyWith<PanelPlan> get copyWith => _$PanelPlanCopyWithImpl<PanelPlan>(this as PanelPlan, _$identity);

  /// Serializes this PanelPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.monthPrice, monthPrice) || other.monthPrice == monthPrice)&&(identical(other.quarterPrice, quarterPrice) || other.quarterPrice == quarterPrice)&&(identical(other.halfYearPrice, halfYearPrice) || other.halfYearPrice == halfYearPrice)&&(identical(other.yearPrice, yearPrice) || other.yearPrice == yearPrice)&&(identical(other.twoYearPrice, twoYearPrice) || other.twoYearPrice == twoYearPrice)&&(identical(other.threeYearPrice, threeYearPrice) || other.threeYearPrice == threeYearPrice)&&(identical(other.onetimePrice, onetimePrice) || other.onetimePrice == onetimePrice)&&(identical(other.resetPrice, resetPrice) || other.resetPrice == resetPrice)&&(identical(other.show, show) || other.show == show)&&(identical(other.renew, renew) || other.renew == renew)&&(identical(other.capacityLimit, capacityLimit) || other.capacityLimit == capacityLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,transferEnable,deviceLimit,speedLimit,monthPrice,quarterPrice,halfYearPrice,yearPrice,twoYearPrice,threeYearPrice,onetimePrice,resetPrice,show,renew,capacityLimit);

@override
String toString() {
  return 'PanelPlan(id: $id, name: $name, content: $content, transferEnable: $transferEnable, deviceLimit: $deviceLimit, speedLimit: $speedLimit, monthPrice: $monthPrice, quarterPrice: $quarterPrice, halfYearPrice: $halfYearPrice, yearPrice: $yearPrice, twoYearPrice: $twoYearPrice, threeYearPrice: $threeYearPrice, onetimePrice: $onetimePrice, resetPrice: $resetPrice, show: $show, renew: $renew, capacityLimit: $capacityLimit)';
}


}

/// @nodoc
abstract mixin class $PanelPlanCopyWith<$Res>  {
  factory $PanelPlanCopyWith(PanelPlan value, $Res Function(PanelPlan) _then) = _$PanelPlanCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? content,@JsonKey(name: 'transfer_enable') int? transferEnable,@JsonKey(name: 'device_limit') int? deviceLimit,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'month_price') int? monthPrice,@JsonKey(name: 'quarter_price') int? quarterPrice,@JsonKey(name: 'half_year_price') int? halfYearPrice,@JsonKey(name: 'year_price') int? yearPrice,@JsonKey(name: 'two_year_price') int? twoYearPrice,@JsonKey(name: 'three_year_price') int? threeYearPrice,@JsonKey(name: 'onetime_price') int? onetimePrice,@JsonKey(name: 'reset_price') int? resetPrice, int? show, int? renew,@JsonKey(name: 'capacity_limit') int? capacityLimit
});




}
/// @nodoc
class _$PanelPlanCopyWithImpl<$Res>
    implements $PanelPlanCopyWith<$Res> {
  _$PanelPlanCopyWithImpl(this._self, this._then);

  final PanelPlan _self;
  final $Res Function(PanelPlan) _then;

/// Create a copy of PanelPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? content = freezed,Object? transferEnable = freezed,Object? deviceLimit = freezed,Object? speedLimit = freezed,Object? monthPrice = freezed,Object? quarterPrice = freezed,Object? halfYearPrice = freezed,Object? yearPrice = freezed,Object? twoYearPrice = freezed,Object? threeYearPrice = freezed,Object? onetimePrice = freezed,Object? resetPrice = freezed,Object? show = freezed,Object? renew = freezed,Object? capacityLimit = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,monthPrice: freezed == monthPrice ? _self.monthPrice : monthPrice // ignore: cast_nullable_to_non_nullable
as int?,quarterPrice: freezed == quarterPrice ? _self.quarterPrice : quarterPrice // ignore: cast_nullable_to_non_nullable
as int?,halfYearPrice: freezed == halfYearPrice ? _self.halfYearPrice : halfYearPrice // ignore: cast_nullable_to_non_nullable
as int?,yearPrice: freezed == yearPrice ? _self.yearPrice : yearPrice // ignore: cast_nullable_to_non_nullable
as int?,twoYearPrice: freezed == twoYearPrice ? _self.twoYearPrice : twoYearPrice // ignore: cast_nullable_to_non_nullable
as int?,threeYearPrice: freezed == threeYearPrice ? _self.threeYearPrice : threeYearPrice // ignore: cast_nullable_to_non_nullable
as int?,onetimePrice: freezed == onetimePrice ? _self.onetimePrice : onetimePrice // ignore: cast_nullable_to_non_nullable
as int?,resetPrice: freezed == resetPrice ? _self.resetPrice : resetPrice // ignore: cast_nullable_to_non_nullable
as int?,show: freezed == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as int?,renew: freezed == renew ? _self.renew : renew // ignore: cast_nullable_to_non_nullable
as int?,capacityLimit: freezed == capacityLimit ? _self.capacityLimit : capacityLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelPlan].
extension PanelPlanPatterns on PanelPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelPlan value)  $default,){
final _that = this;
switch (_that) {
case _PanelPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelPlan value)?  $default,){
final _that = this;
switch (_that) {
case _PanelPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? content, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'month_price')  int? monthPrice, @JsonKey(name: 'quarter_price')  int? quarterPrice, @JsonKey(name: 'half_year_price')  int? halfYearPrice, @JsonKey(name: 'year_price')  int? yearPrice, @JsonKey(name: 'two_year_price')  int? twoYearPrice, @JsonKey(name: 'three_year_price')  int? threeYearPrice, @JsonKey(name: 'onetime_price')  int? onetimePrice, @JsonKey(name: 'reset_price')  int? resetPrice,  int? show,  int? renew, @JsonKey(name: 'capacity_limit')  int? capacityLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelPlan() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.transferEnable,_that.deviceLimit,_that.speedLimit,_that.monthPrice,_that.quarterPrice,_that.halfYearPrice,_that.yearPrice,_that.twoYearPrice,_that.threeYearPrice,_that.onetimePrice,_that.resetPrice,_that.show,_that.renew,_that.capacityLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? content, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'month_price')  int? monthPrice, @JsonKey(name: 'quarter_price')  int? quarterPrice, @JsonKey(name: 'half_year_price')  int? halfYearPrice, @JsonKey(name: 'year_price')  int? yearPrice, @JsonKey(name: 'two_year_price')  int? twoYearPrice, @JsonKey(name: 'three_year_price')  int? threeYearPrice, @JsonKey(name: 'onetime_price')  int? onetimePrice, @JsonKey(name: 'reset_price')  int? resetPrice,  int? show,  int? renew, @JsonKey(name: 'capacity_limit')  int? capacityLimit)  $default,) {final _that = this;
switch (_that) {
case _PanelPlan():
return $default(_that.id,_that.name,_that.content,_that.transferEnable,_that.deviceLimit,_that.speedLimit,_that.monthPrice,_that.quarterPrice,_that.halfYearPrice,_that.yearPrice,_that.twoYearPrice,_that.threeYearPrice,_that.onetimePrice,_that.resetPrice,_that.show,_that.renew,_that.capacityLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? content, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'device_limit')  int? deviceLimit, @JsonKey(name: 'speed_limit')  int? speedLimit, @JsonKey(name: 'month_price')  int? monthPrice, @JsonKey(name: 'quarter_price')  int? quarterPrice, @JsonKey(name: 'half_year_price')  int? halfYearPrice, @JsonKey(name: 'year_price')  int? yearPrice, @JsonKey(name: 'two_year_price')  int? twoYearPrice, @JsonKey(name: 'three_year_price')  int? threeYearPrice, @JsonKey(name: 'onetime_price')  int? onetimePrice, @JsonKey(name: 'reset_price')  int? resetPrice,  int? show,  int? renew, @JsonKey(name: 'capacity_limit')  int? capacityLimit)?  $default,) {final _that = this;
switch (_that) {
case _PanelPlan() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.transferEnable,_that.deviceLimit,_that.speedLimit,_that.monthPrice,_that.quarterPrice,_that.halfYearPrice,_that.yearPrice,_that.twoYearPrice,_that.threeYearPrice,_that.onetimePrice,_that.resetPrice,_that.show,_that.renew,_that.capacityLimit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelPlan implements PanelPlan {
  const _PanelPlan({this.id, this.name, this.content, @JsonKey(name: 'transfer_enable') this.transferEnable, @JsonKey(name: 'device_limit') this.deviceLimit, @JsonKey(name: 'speed_limit') this.speedLimit, @JsonKey(name: 'month_price') this.monthPrice, @JsonKey(name: 'quarter_price') this.quarterPrice, @JsonKey(name: 'half_year_price') this.halfYearPrice, @JsonKey(name: 'year_price') this.yearPrice, @JsonKey(name: 'two_year_price') this.twoYearPrice, @JsonKey(name: 'three_year_price') this.threeYearPrice, @JsonKey(name: 'onetime_price') this.onetimePrice, @JsonKey(name: 'reset_price') this.resetPrice, this.show, this.renew, @JsonKey(name: 'capacity_limit') this.capacityLimit});
  factory _PanelPlan.fromJson(Map<String, dynamic> json) => _$PanelPlanFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? content;
@override@JsonKey(name: 'transfer_enable') final  int? transferEnable;
@override@JsonKey(name: 'device_limit') final  int? deviceLimit;
@override@JsonKey(name: 'speed_limit') final  int? speedLimit;
@override@JsonKey(name: 'month_price') final  int? monthPrice;
@override@JsonKey(name: 'quarter_price') final  int? quarterPrice;
@override@JsonKey(name: 'half_year_price') final  int? halfYearPrice;
@override@JsonKey(name: 'year_price') final  int? yearPrice;
@override@JsonKey(name: 'two_year_price') final  int? twoYearPrice;
@override@JsonKey(name: 'three_year_price') final  int? threeYearPrice;
@override@JsonKey(name: 'onetime_price') final  int? onetimePrice;
@override@JsonKey(name: 'reset_price') final  int? resetPrice;
@override final  int? show;
@override final  int? renew;
@override@JsonKey(name: 'capacity_limit') final  int? capacityLimit;

/// Create a copy of PanelPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelPlanCopyWith<_PanelPlan> get copyWith => __$PanelPlanCopyWithImpl<_PanelPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.speedLimit, speedLimit) || other.speedLimit == speedLimit)&&(identical(other.monthPrice, monthPrice) || other.monthPrice == monthPrice)&&(identical(other.quarterPrice, quarterPrice) || other.quarterPrice == quarterPrice)&&(identical(other.halfYearPrice, halfYearPrice) || other.halfYearPrice == halfYearPrice)&&(identical(other.yearPrice, yearPrice) || other.yearPrice == yearPrice)&&(identical(other.twoYearPrice, twoYearPrice) || other.twoYearPrice == twoYearPrice)&&(identical(other.threeYearPrice, threeYearPrice) || other.threeYearPrice == threeYearPrice)&&(identical(other.onetimePrice, onetimePrice) || other.onetimePrice == onetimePrice)&&(identical(other.resetPrice, resetPrice) || other.resetPrice == resetPrice)&&(identical(other.show, show) || other.show == show)&&(identical(other.renew, renew) || other.renew == renew)&&(identical(other.capacityLimit, capacityLimit) || other.capacityLimit == capacityLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,transferEnable,deviceLimit,speedLimit,monthPrice,quarterPrice,halfYearPrice,yearPrice,twoYearPrice,threeYearPrice,onetimePrice,resetPrice,show,renew,capacityLimit);

@override
String toString() {
  return 'PanelPlan(id: $id, name: $name, content: $content, transferEnable: $transferEnable, deviceLimit: $deviceLimit, speedLimit: $speedLimit, monthPrice: $monthPrice, quarterPrice: $quarterPrice, halfYearPrice: $halfYearPrice, yearPrice: $yearPrice, twoYearPrice: $twoYearPrice, threeYearPrice: $threeYearPrice, onetimePrice: $onetimePrice, resetPrice: $resetPrice, show: $show, renew: $renew, capacityLimit: $capacityLimit)';
}


}

/// @nodoc
abstract mixin class _$PanelPlanCopyWith<$Res> implements $PanelPlanCopyWith<$Res> {
  factory _$PanelPlanCopyWith(_PanelPlan value, $Res Function(_PanelPlan) _then) = __$PanelPlanCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? content,@JsonKey(name: 'transfer_enable') int? transferEnable,@JsonKey(name: 'device_limit') int? deviceLimit,@JsonKey(name: 'speed_limit') int? speedLimit,@JsonKey(name: 'month_price') int? monthPrice,@JsonKey(name: 'quarter_price') int? quarterPrice,@JsonKey(name: 'half_year_price') int? halfYearPrice,@JsonKey(name: 'year_price') int? yearPrice,@JsonKey(name: 'two_year_price') int? twoYearPrice,@JsonKey(name: 'three_year_price') int? threeYearPrice,@JsonKey(name: 'onetime_price') int? onetimePrice,@JsonKey(name: 'reset_price') int? resetPrice, int? show, int? renew,@JsonKey(name: 'capacity_limit') int? capacityLimit
});




}
/// @nodoc
class __$PanelPlanCopyWithImpl<$Res>
    implements _$PanelPlanCopyWith<$Res> {
  __$PanelPlanCopyWithImpl(this._self, this._then);

  final _PanelPlan _self;
  final $Res Function(_PanelPlan) _then;

/// Create a copy of PanelPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? content = freezed,Object? transferEnable = freezed,Object? deviceLimit = freezed,Object? speedLimit = freezed,Object? monthPrice = freezed,Object? quarterPrice = freezed,Object? halfYearPrice = freezed,Object? yearPrice = freezed,Object? twoYearPrice = freezed,Object? threeYearPrice = freezed,Object? onetimePrice = freezed,Object? resetPrice = freezed,Object? show = freezed,Object? renew = freezed,Object? capacityLimit = freezed,}) {
  return _then(_PanelPlan(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,speedLimit: freezed == speedLimit ? _self.speedLimit : speedLimit // ignore: cast_nullable_to_non_nullable
as int?,monthPrice: freezed == monthPrice ? _self.monthPrice : monthPrice // ignore: cast_nullable_to_non_nullable
as int?,quarterPrice: freezed == quarterPrice ? _self.quarterPrice : quarterPrice // ignore: cast_nullable_to_non_nullable
as int?,halfYearPrice: freezed == halfYearPrice ? _self.halfYearPrice : halfYearPrice // ignore: cast_nullable_to_non_nullable
as int?,yearPrice: freezed == yearPrice ? _self.yearPrice : yearPrice // ignore: cast_nullable_to_non_nullable
as int?,twoYearPrice: freezed == twoYearPrice ? _self.twoYearPrice : twoYearPrice // ignore: cast_nullable_to_non_nullable
as int?,threeYearPrice: freezed == threeYearPrice ? _self.threeYearPrice : threeYearPrice // ignore: cast_nullable_to_non_nullable
as int?,onetimePrice: freezed == onetimePrice ? _self.onetimePrice : onetimePrice // ignore: cast_nullable_to_non_nullable
as int?,resetPrice: freezed == resetPrice ? _self.resetPrice : resetPrice // ignore: cast_nullable_to_non_nullable
as int?,show: freezed == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as int?,renew: freezed == renew ? _self.renew : renew // ignore: cast_nullable_to_non_nullable
as int?,capacityLimit: freezed == capacityLimit ? _self.capacityLimit : capacityLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PanelPaymentMethod {

@JsonKey(name: 'id', fromJson: _idFromJson) String? get id; String? get name; bool? get enable;
/// Create a copy of PanelPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelPaymentMethodCopyWith<PanelPaymentMethod> get copyWith => _$PanelPaymentMethodCopyWithImpl<PanelPaymentMethod>(this as PanelPaymentMethod, _$identity);

  /// Serializes this PanelPaymentMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelPaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enable, enable) || other.enable == enable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enable);

@override
String toString() {
  return 'PanelPaymentMethod(id: $id, name: $name, enable: $enable)';
}


}

/// @nodoc
abstract mixin class $PanelPaymentMethodCopyWith<$Res>  {
  factory $PanelPaymentMethodCopyWith(PanelPaymentMethod value, $Res Function(PanelPaymentMethod) _then) = _$PanelPaymentMethodCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _idFromJson) String? id, String? name, bool? enable
});




}
/// @nodoc
class _$PanelPaymentMethodCopyWithImpl<$Res>
    implements $PanelPaymentMethodCopyWith<$Res> {
  _$PanelPaymentMethodCopyWithImpl(this._self, this._then);

  final PanelPaymentMethod _self;
  final $Res Function(PanelPaymentMethod) _then;

/// Create a copy of PanelPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? enable = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,enable: freezed == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelPaymentMethod].
extension PanelPaymentMethodPatterns on PanelPaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelPaymentMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelPaymentMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelPaymentMethod value)  $default,){
final _that = this;
switch (_that) {
case _PanelPaymentMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelPaymentMethod value)?  $default,){
final _that = this;
switch (_that) {
case _PanelPaymentMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _idFromJson)  String? id,  String? name,  bool? enable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelPaymentMethod() when $default != null:
return $default(_that.id,_that.name,_that.enable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _idFromJson)  String? id,  String? name,  bool? enable)  $default,) {final _that = this;
switch (_that) {
case _PanelPaymentMethod():
return $default(_that.id,_that.name,_that.enable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _idFromJson)  String? id,  String? name,  bool? enable)?  $default,) {final _that = this;
switch (_that) {
case _PanelPaymentMethod() when $default != null:
return $default(_that.id,_that.name,_that.enable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelPaymentMethod implements PanelPaymentMethod {
  const _PanelPaymentMethod({@JsonKey(name: 'id', fromJson: _idFromJson) this.id, this.name, this.enable});
  factory _PanelPaymentMethod.fromJson(Map<String, dynamic> json) => _$PanelPaymentMethodFromJson(json);

@override@JsonKey(name: 'id', fromJson: _idFromJson) final  String? id;
@override final  String? name;
@override final  bool? enable;

/// Create a copy of PanelPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelPaymentMethodCopyWith<_PanelPaymentMethod> get copyWith => __$PanelPaymentMethodCopyWithImpl<_PanelPaymentMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelPaymentMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelPaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enable, enable) || other.enable == enable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enable);

@override
String toString() {
  return 'PanelPaymentMethod(id: $id, name: $name, enable: $enable)';
}


}

/// @nodoc
abstract mixin class _$PanelPaymentMethodCopyWith<$Res> implements $PanelPaymentMethodCopyWith<$Res> {
  factory _$PanelPaymentMethodCopyWith(_PanelPaymentMethod value, $Res Function(_PanelPaymentMethod) _then) = __$PanelPaymentMethodCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _idFromJson) String? id, String? name, bool? enable
});




}
/// @nodoc
class __$PanelPaymentMethodCopyWithImpl<$Res>
    implements _$PanelPaymentMethodCopyWith<$Res> {
  __$PanelPaymentMethodCopyWithImpl(this._self, this._then);

  final _PanelPaymentMethod _self;
  final $Res Function(_PanelPaymentMethod) _then;

/// Create a copy of PanelPaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? enable = freezed,}) {
  return _then(_PanelPaymentMethod(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,enable: freezed == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$PanelSiteConfig {

@JsonKey(name: 'is_email_verify', fromJson: _intFromJson) int get isEmailVerify;@JsonKey(name: 'is_invite_force', fromJson: _intFromJson) int get isInviteForce;@JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson) List<String> get emailWhitelistSuffix;@JsonKey(name: 'tos_url') String? get tosUrl;
/// Create a copy of PanelSiteConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelSiteConfigCopyWith<PanelSiteConfig> get copyWith => _$PanelSiteConfigCopyWithImpl<PanelSiteConfig>(this as PanelSiteConfig, _$identity);

  /// Serializes this PanelSiteConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelSiteConfig&&(identical(other.isEmailVerify, isEmailVerify) || other.isEmailVerify == isEmailVerify)&&(identical(other.isInviteForce, isInviteForce) || other.isInviteForce == isInviteForce)&&const DeepCollectionEquality().equals(other.emailWhitelistSuffix, emailWhitelistSuffix)&&(identical(other.tosUrl, tosUrl) || other.tosUrl == tosUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isEmailVerify,isInviteForce,const DeepCollectionEquality().hash(emailWhitelistSuffix),tosUrl);

@override
String toString() {
  return 'PanelSiteConfig(isEmailVerify: $isEmailVerify, isInviteForce: $isInviteForce, emailWhitelistSuffix: $emailWhitelistSuffix, tosUrl: $tosUrl)';
}


}

/// @nodoc
abstract mixin class $PanelSiteConfigCopyWith<$Res>  {
  factory $PanelSiteConfigCopyWith(PanelSiteConfig value, $Res Function(PanelSiteConfig) _then) = _$PanelSiteConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_email_verify', fromJson: _intFromJson) int isEmailVerify,@JsonKey(name: 'is_invite_force', fromJson: _intFromJson) int isInviteForce,@JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson) List<String> emailWhitelistSuffix,@JsonKey(name: 'tos_url') String? tosUrl
});




}
/// @nodoc
class _$PanelSiteConfigCopyWithImpl<$Res>
    implements $PanelSiteConfigCopyWith<$Res> {
  _$PanelSiteConfigCopyWithImpl(this._self, this._then);

  final PanelSiteConfig _self;
  final $Res Function(PanelSiteConfig) _then;

/// Create a copy of PanelSiteConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isEmailVerify = null,Object? isInviteForce = null,Object? emailWhitelistSuffix = null,Object? tosUrl = freezed,}) {
  return _then(_self.copyWith(
isEmailVerify: null == isEmailVerify ? _self.isEmailVerify : isEmailVerify // ignore: cast_nullable_to_non_nullable
as int,isInviteForce: null == isInviteForce ? _self.isInviteForce : isInviteForce // ignore: cast_nullable_to_non_nullable
as int,emailWhitelistSuffix: null == emailWhitelistSuffix ? _self.emailWhitelistSuffix : emailWhitelistSuffix // ignore: cast_nullable_to_non_nullable
as List<String>,tosUrl: freezed == tosUrl ? _self.tosUrl : tosUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelSiteConfig].
extension PanelSiteConfigPatterns on PanelSiteConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelSiteConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelSiteConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelSiteConfig value)  $default,){
final _that = this;
switch (_that) {
case _PanelSiteConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelSiteConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PanelSiteConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_email_verify', fromJson: _intFromJson)  int isEmailVerify, @JsonKey(name: 'is_invite_force', fromJson: _intFromJson)  int isInviteForce, @JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson)  List<String> emailWhitelistSuffix, @JsonKey(name: 'tos_url')  String? tosUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelSiteConfig() when $default != null:
return $default(_that.isEmailVerify,_that.isInviteForce,_that.emailWhitelistSuffix,_that.tosUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_email_verify', fromJson: _intFromJson)  int isEmailVerify, @JsonKey(name: 'is_invite_force', fromJson: _intFromJson)  int isInviteForce, @JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson)  List<String> emailWhitelistSuffix, @JsonKey(name: 'tos_url')  String? tosUrl)  $default,) {final _that = this;
switch (_that) {
case _PanelSiteConfig():
return $default(_that.isEmailVerify,_that.isInviteForce,_that.emailWhitelistSuffix,_that.tosUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_email_verify', fromJson: _intFromJson)  int isEmailVerify, @JsonKey(name: 'is_invite_force', fromJson: _intFromJson)  int isInviteForce, @JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson)  List<String> emailWhitelistSuffix, @JsonKey(name: 'tos_url')  String? tosUrl)?  $default,) {final _that = this;
switch (_that) {
case _PanelSiteConfig() when $default != null:
return $default(_that.isEmailVerify,_that.isInviteForce,_that.emailWhitelistSuffix,_that.tosUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelSiteConfig implements PanelSiteConfig {
  const _PanelSiteConfig({@JsonKey(name: 'is_email_verify', fromJson: _intFromJson) this.isEmailVerify = 0, @JsonKey(name: 'is_invite_force', fromJson: _intFromJson) this.isInviteForce = 0, @JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson) final  List<String> emailWhitelistSuffix = const [], @JsonKey(name: 'tos_url') this.tosUrl}): _emailWhitelistSuffix = emailWhitelistSuffix;
  factory _PanelSiteConfig.fromJson(Map<String, dynamic> json) => _$PanelSiteConfigFromJson(json);

@override@JsonKey(name: 'is_email_verify', fromJson: _intFromJson) final  int isEmailVerify;
@override@JsonKey(name: 'is_invite_force', fromJson: _intFromJson) final  int isInviteForce;
 final  List<String> _emailWhitelistSuffix;
@override@JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson) List<String> get emailWhitelistSuffix {
  if (_emailWhitelistSuffix is EqualUnmodifiableListView) return _emailWhitelistSuffix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emailWhitelistSuffix);
}

@override@JsonKey(name: 'tos_url') final  String? tosUrl;

/// Create a copy of PanelSiteConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelSiteConfigCopyWith<_PanelSiteConfig> get copyWith => __$PanelSiteConfigCopyWithImpl<_PanelSiteConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelSiteConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelSiteConfig&&(identical(other.isEmailVerify, isEmailVerify) || other.isEmailVerify == isEmailVerify)&&(identical(other.isInviteForce, isInviteForce) || other.isInviteForce == isInviteForce)&&const DeepCollectionEquality().equals(other._emailWhitelistSuffix, _emailWhitelistSuffix)&&(identical(other.tosUrl, tosUrl) || other.tosUrl == tosUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isEmailVerify,isInviteForce,const DeepCollectionEquality().hash(_emailWhitelistSuffix),tosUrl);

@override
String toString() {
  return 'PanelSiteConfig(isEmailVerify: $isEmailVerify, isInviteForce: $isInviteForce, emailWhitelistSuffix: $emailWhitelistSuffix, tosUrl: $tosUrl)';
}


}

/// @nodoc
abstract mixin class _$PanelSiteConfigCopyWith<$Res> implements $PanelSiteConfigCopyWith<$Res> {
  factory _$PanelSiteConfigCopyWith(_PanelSiteConfig value, $Res Function(_PanelSiteConfig) _then) = __$PanelSiteConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_email_verify', fromJson: _intFromJson) int isEmailVerify,@JsonKey(name: 'is_invite_force', fromJson: _intFromJson) int isInviteForce,@JsonKey(name: 'email_whitelist_suffix', fromJson: _suffixListFromJson, toJson: _suffixListToJson) List<String> emailWhitelistSuffix,@JsonKey(name: 'tos_url') String? tosUrl
});




}
/// @nodoc
class __$PanelSiteConfigCopyWithImpl<$Res>
    implements _$PanelSiteConfigCopyWith<$Res> {
  __$PanelSiteConfigCopyWithImpl(this._self, this._then);

  final _PanelSiteConfig _self;
  final $Res Function(_PanelSiteConfig) _then;

/// Create a copy of PanelSiteConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isEmailVerify = null,Object? isInviteForce = null,Object? emailWhitelistSuffix = null,Object? tosUrl = freezed,}) {
  return _then(_PanelSiteConfig(
isEmailVerify: null == isEmailVerify ? _self.isEmailVerify : isEmailVerify // ignore: cast_nullable_to_non_nullable
as int,isInviteForce: null == isInviteForce ? _self.isInviteForce : isInviteForce // ignore: cast_nullable_to_non_nullable
as int,emailWhitelistSuffix: null == emailWhitelistSuffix ? _self._emailWhitelistSuffix : emailWhitelistSuffix // ignore: cast_nullable_to_non_nullable
as List<String>,tosUrl: freezed == tosUrl ? _self.tosUrl : tosUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PanelOrder {

@JsonKey(name: 'trade_no') String? get tradeNo;@JsonKey(name: 'total_amount') int? get totalAmount;@JsonKey(name: 'plan_id') int? get planId; String? get period; int? get status;@JsonKey(name: 'created_at') int? get createdAt;
/// Create a copy of PanelOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelOrderCopyWith<PanelOrder> get copyWith => _$PanelOrderCopyWithImpl<PanelOrder>(this as PanelOrder, _$identity);

  /// Serializes this PanelOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelOrder&&(identical(other.tradeNo, tradeNo) || other.tradeNo == tradeNo)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.period, period) || other.period == period)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tradeNo,totalAmount,planId,period,status,createdAt);

@override
String toString() {
  return 'PanelOrder(tradeNo: $tradeNo, totalAmount: $totalAmount, planId: $planId, period: $period, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PanelOrderCopyWith<$Res>  {
  factory $PanelOrderCopyWith(PanelOrder value, $Res Function(PanelOrder) _then) = _$PanelOrderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'trade_no') String? tradeNo,@JsonKey(name: 'total_amount') int? totalAmount,@JsonKey(name: 'plan_id') int? planId, String? period, int? status,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class _$PanelOrderCopyWithImpl<$Res>
    implements $PanelOrderCopyWith<$Res> {
  _$PanelOrderCopyWithImpl(this._self, this._then);

  final PanelOrder _self;
  final $Res Function(PanelOrder) _then;

/// Create a copy of PanelOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tradeNo = freezed,Object? totalAmount = freezed,Object? planId = freezed,Object? period = freezed,Object? status = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
tradeNo: freezed == tradeNo ? _self.tradeNo : tradeNo // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelOrder].
extension PanelOrderPatterns on PanelOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelOrder value)  $default,){
final _that = this;
switch (_that) {
case _PanelOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelOrder value)?  $default,){
final _that = this;
switch (_that) {
case _PanelOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'trade_no')  String? tradeNo, @JsonKey(name: 'total_amount')  int? totalAmount, @JsonKey(name: 'plan_id')  int? planId,  String? period,  int? status, @JsonKey(name: 'created_at')  int? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelOrder() when $default != null:
return $default(_that.tradeNo,_that.totalAmount,_that.planId,_that.period,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'trade_no')  String? tradeNo, @JsonKey(name: 'total_amount')  int? totalAmount, @JsonKey(name: 'plan_id')  int? planId,  String? period,  int? status, @JsonKey(name: 'created_at')  int? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PanelOrder():
return $default(_that.tradeNo,_that.totalAmount,_that.planId,_that.period,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'trade_no')  String? tradeNo, @JsonKey(name: 'total_amount')  int? totalAmount, @JsonKey(name: 'plan_id')  int? planId,  String? period,  int? status, @JsonKey(name: 'created_at')  int? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PanelOrder() when $default != null:
return $default(_that.tradeNo,_that.totalAmount,_that.planId,_that.period,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelOrder implements PanelOrder {
  const _PanelOrder({@JsonKey(name: 'trade_no') this.tradeNo, @JsonKey(name: 'total_amount') this.totalAmount, @JsonKey(name: 'plan_id') this.planId, this.period, this.status, @JsonKey(name: 'created_at') this.createdAt});
  factory _PanelOrder.fromJson(Map<String, dynamic> json) => _$PanelOrderFromJson(json);

@override@JsonKey(name: 'trade_no') final  String? tradeNo;
@override@JsonKey(name: 'total_amount') final  int? totalAmount;
@override@JsonKey(name: 'plan_id') final  int? planId;
@override final  String? period;
@override final  int? status;
@override@JsonKey(name: 'created_at') final  int? createdAt;

/// Create a copy of PanelOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelOrderCopyWith<_PanelOrder> get copyWith => __$PanelOrderCopyWithImpl<_PanelOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelOrder&&(identical(other.tradeNo, tradeNo) || other.tradeNo == tradeNo)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.period, period) || other.period == period)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tradeNo,totalAmount,planId,period,status,createdAt);

@override
String toString() {
  return 'PanelOrder(tradeNo: $tradeNo, totalAmount: $totalAmount, planId: $planId, period: $period, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PanelOrderCopyWith<$Res> implements $PanelOrderCopyWith<$Res> {
  factory _$PanelOrderCopyWith(_PanelOrder value, $Res Function(_PanelOrder) _then) = __$PanelOrderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'trade_no') String? tradeNo,@JsonKey(name: 'total_amount') int? totalAmount,@JsonKey(name: 'plan_id') int? planId, String? period, int? status,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class __$PanelOrderCopyWithImpl<$Res>
    implements _$PanelOrderCopyWith<$Res> {
  __$PanelOrderCopyWithImpl(this._self, this._then);

  final _PanelOrder _self;
  final $Res Function(_PanelOrder) _then;

/// Create a copy of PanelOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tradeNo = freezed,Object? totalAmount = freezed,Object? planId = freezed,Object? period = freezed,Object? status = freezed,Object? createdAt = freezed,}) {
  return _then(_PanelOrder(
tradeNo: freezed == tradeNo ? _self.tradeNo : tradeNo // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PanelTicket {

 int? get id; String? get subject; int? get level; int? get status; String? get message;@JsonKey(name: 'created_at') int? get createdAt;@JsonKey(name: 'updated_at') int? get updatedAt;
/// Create a copy of PanelTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelTicketCopyWith<PanelTicket> get copyWith => _$PanelTicketCopyWithImpl<PanelTicket>(this as PanelTicket, _$identity);

  /// Serializes this PanelTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,level,status,message,createdAt,updatedAt);

@override
String toString() {
  return 'PanelTicket(id: $id, subject: $subject, level: $level, status: $status, message: $message, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PanelTicketCopyWith<$Res>  {
  factory $PanelTicketCopyWith(PanelTicket value, $Res Function(PanelTicket) _then) = _$PanelTicketCopyWithImpl;
@useResult
$Res call({
 int? id, String? subject, int? level, int? status, String? message,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class _$PanelTicketCopyWithImpl<$Res>
    implements $PanelTicketCopyWith<$Res> {
  _$PanelTicketCopyWithImpl(this._self, this._then);

  final PanelTicket _self;
  final $Res Function(PanelTicket) _then;

/// Create a copy of PanelTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? subject = freezed,Object? level = freezed,Object? status = freezed,Object? message = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelTicket].
extension PanelTicketPatterns on PanelTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelTicket value)  $default,){
final _that = this;
switch (_that) {
case _PanelTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelTicket value)?  $default,){
final _that = this;
switch (_that) {
case _PanelTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? subject,  int? level,  int? status,  String? message, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelTicket() when $default != null:
return $default(_that.id,_that.subject,_that.level,_that.status,_that.message,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? subject,  int? level,  int? status,  String? message, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PanelTicket():
return $default(_that.id,_that.subject,_that.level,_that.status,_that.message,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? subject,  int? level,  int? status,  String? message, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PanelTicket() when $default != null:
return $default(_that.id,_that.subject,_that.level,_that.status,_that.message,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelTicket implements PanelTicket {
  const _PanelTicket({this.id, this.subject, this.level, this.status, this.message, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _PanelTicket.fromJson(Map<String, dynamic> json) => _$PanelTicketFromJson(json);

@override final  int? id;
@override final  String? subject;
@override final  int? level;
@override final  int? status;
@override final  String? message;
@override@JsonKey(name: 'created_at') final  int? createdAt;
@override@JsonKey(name: 'updated_at') final  int? updatedAt;

/// Create a copy of PanelTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelTicketCopyWith<_PanelTicket> get copyWith => __$PanelTicketCopyWithImpl<_PanelTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,level,status,message,createdAt,updatedAt);

@override
String toString() {
  return 'PanelTicket(id: $id, subject: $subject, level: $level, status: $status, message: $message, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PanelTicketCopyWith<$Res> implements $PanelTicketCopyWith<$Res> {
  factory _$PanelTicketCopyWith(_PanelTicket value, $Res Function(_PanelTicket) _then) = __$PanelTicketCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? subject, int? level, int? status, String? message,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt
});




}
/// @nodoc
class __$PanelTicketCopyWithImpl<$Res>
    implements _$PanelTicketCopyWith<$Res> {
  __$PanelTicketCopyWithImpl(this._self, this._then);

  final _PanelTicket _self;
  final $Res Function(_PanelTicket) _then;

/// Create a copy of PanelTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? subject = freezed,Object? level = freezed,Object? status = freezed,Object? message = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PanelTicket(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PanelTicketMessage {

 int? get id; String? get message;@JsonKey(name: 'is_me') bool? get isMe;@JsonKey(name: 'created_at') int? get createdAt;
/// Create a copy of PanelTicketMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelTicketMessageCopyWith<PanelTicketMessage> get copyWith => _$PanelTicketMessageCopyWithImpl<PanelTicketMessage>(this as PanelTicketMessage, _$identity);

  /// Serializes this PanelTicketMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelTicketMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,isMe,createdAt);

@override
String toString() {
  return 'PanelTicketMessage(id: $id, message: $message, isMe: $isMe, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PanelTicketMessageCopyWith<$Res>  {
  factory $PanelTicketMessageCopyWith(PanelTicketMessage value, $Res Function(PanelTicketMessage) _then) = _$PanelTicketMessageCopyWithImpl;
@useResult
$Res call({
 int? id, String? message,@JsonKey(name: 'is_me') bool? isMe,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class _$PanelTicketMessageCopyWithImpl<$Res>
    implements $PanelTicketMessageCopyWith<$Res> {
  _$PanelTicketMessageCopyWithImpl(this._self, this._then);

  final PanelTicketMessage _self;
  final $Res Function(PanelTicketMessage) _then;

/// Create a copy of PanelTicketMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? message = freezed,Object? isMe = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isMe: freezed == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelTicketMessage].
extension PanelTicketMessagePatterns on PanelTicketMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelTicketMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelTicketMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelTicketMessage value)  $default,){
final _that = this;
switch (_that) {
case _PanelTicketMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelTicketMessage value)?  $default,){
final _that = this;
switch (_that) {
case _PanelTicketMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? message, @JsonKey(name: 'is_me')  bool? isMe, @JsonKey(name: 'created_at')  int? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelTicketMessage() when $default != null:
return $default(_that.id,_that.message,_that.isMe,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? message, @JsonKey(name: 'is_me')  bool? isMe, @JsonKey(name: 'created_at')  int? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PanelTicketMessage():
return $default(_that.id,_that.message,_that.isMe,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? message, @JsonKey(name: 'is_me')  bool? isMe, @JsonKey(name: 'created_at')  int? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PanelTicketMessage() when $default != null:
return $default(_that.id,_that.message,_that.isMe,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelTicketMessage implements PanelTicketMessage {
  const _PanelTicketMessage({this.id, this.message, @JsonKey(name: 'is_me') this.isMe, @JsonKey(name: 'created_at') this.createdAt});
  factory _PanelTicketMessage.fromJson(Map<String, dynamic> json) => _$PanelTicketMessageFromJson(json);

@override final  int? id;
@override final  String? message;
@override@JsonKey(name: 'is_me') final  bool? isMe;
@override@JsonKey(name: 'created_at') final  int? createdAt;

/// Create a copy of PanelTicketMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelTicketMessageCopyWith<_PanelTicketMessage> get copyWith => __$PanelTicketMessageCopyWithImpl<_PanelTicketMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelTicketMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelTicketMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,isMe,createdAt);

@override
String toString() {
  return 'PanelTicketMessage(id: $id, message: $message, isMe: $isMe, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PanelTicketMessageCopyWith<$Res> implements $PanelTicketMessageCopyWith<$Res> {
  factory _$PanelTicketMessageCopyWith(_PanelTicketMessage value, $Res Function(_PanelTicketMessage) _then) = __$PanelTicketMessageCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? message,@JsonKey(name: 'is_me') bool? isMe,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class __$PanelTicketMessageCopyWithImpl<$Res>
    implements _$PanelTicketMessageCopyWith<$Res> {
  __$PanelTicketMessageCopyWithImpl(this._self, this._then);

  final _PanelTicketMessage _self;
  final $Res Function(_PanelTicketMessage) _then;

/// Create a copy of PanelTicketMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? message = freezed,Object? isMe = freezed,Object? createdAt = freezed,}) {
  return _then(_PanelTicketMessage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isMe: freezed == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PanelTicketDetail {

 int? get id; String? get subject; int? get level; int? get status;@JsonKey(name: 'created_at') int? get createdAt; List<PanelTicketMessage> get message;
/// Create a copy of PanelTicketDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelTicketDetailCopyWith<PanelTicketDetail> get copyWith => _$PanelTicketDetailCopyWithImpl<PanelTicketDetail>(this as PanelTicketDetail, _$identity);

  /// Serializes this PanelTicketDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelTicketDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.message, message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,level,status,createdAt,const DeepCollectionEquality().hash(message));

@override
String toString() {
  return 'PanelTicketDetail(id: $id, subject: $subject, level: $level, status: $status, createdAt: $createdAt, message: $message)';
}


}

/// @nodoc
abstract mixin class $PanelTicketDetailCopyWith<$Res>  {
  factory $PanelTicketDetailCopyWith(PanelTicketDetail value, $Res Function(PanelTicketDetail) _then) = _$PanelTicketDetailCopyWithImpl;
@useResult
$Res call({
 int? id, String? subject, int? level, int? status,@JsonKey(name: 'created_at') int? createdAt, List<PanelTicketMessage> message
});




}
/// @nodoc
class _$PanelTicketDetailCopyWithImpl<$Res>
    implements $PanelTicketDetailCopyWith<$Res> {
  _$PanelTicketDetailCopyWithImpl(this._self, this._then);

  final PanelTicketDetail _self;
  final $Res Function(PanelTicketDetail) _then;

/// Create a copy of PanelTicketDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? subject = freezed,Object? level = freezed,Object? status = freezed,Object? createdAt = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as List<PanelTicketMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelTicketDetail].
extension PanelTicketDetailPatterns on PanelTicketDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelTicketDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelTicketDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelTicketDetail value)  $default,){
final _that = this;
switch (_that) {
case _PanelTicketDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelTicketDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PanelTicketDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? subject,  int? level,  int? status, @JsonKey(name: 'created_at')  int? createdAt,  List<PanelTicketMessage> message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelTicketDetail() when $default != null:
return $default(_that.id,_that.subject,_that.level,_that.status,_that.createdAt,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? subject,  int? level,  int? status, @JsonKey(name: 'created_at')  int? createdAt,  List<PanelTicketMessage> message)  $default,) {final _that = this;
switch (_that) {
case _PanelTicketDetail():
return $default(_that.id,_that.subject,_that.level,_that.status,_that.createdAt,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? subject,  int? level,  int? status, @JsonKey(name: 'created_at')  int? createdAt,  List<PanelTicketMessage> message)?  $default,) {final _that = this;
switch (_that) {
case _PanelTicketDetail() when $default != null:
return $default(_that.id,_that.subject,_that.level,_that.status,_that.createdAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelTicketDetail implements PanelTicketDetail {
  const _PanelTicketDetail({this.id, this.subject, this.level, this.status, @JsonKey(name: 'created_at') this.createdAt, final  List<PanelTicketMessage> message = const []}): _message = message;
  factory _PanelTicketDetail.fromJson(Map<String, dynamic> json) => _$PanelTicketDetailFromJson(json);

@override final  int? id;
@override final  String? subject;
@override final  int? level;
@override final  int? status;
@override@JsonKey(name: 'created_at') final  int? createdAt;
 final  List<PanelTicketMessage> _message;
@override@JsonKey() List<PanelTicketMessage> get message {
  if (_message is EqualUnmodifiableListView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_message);
}


/// Create a copy of PanelTicketDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelTicketDetailCopyWith<_PanelTicketDetail> get copyWith => __$PanelTicketDetailCopyWithImpl<_PanelTicketDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelTicketDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelTicketDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._message, _message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,level,status,createdAt,const DeepCollectionEquality().hash(_message));

@override
String toString() {
  return 'PanelTicketDetail(id: $id, subject: $subject, level: $level, status: $status, createdAt: $createdAt, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PanelTicketDetailCopyWith<$Res> implements $PanelTicketDetailCopyWith<$Res> {
  factory _$PanelTicketDetailCopyWith(_PanelTicketDetail value, $Res Function(_PanelTicketDetail) _then) = __$PanelTicketDetailCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? subject, int? level, int? status,@JsonKey(name: 'created_at') int? createdAt, List<PanelTicketMessage> message
});




}
/// @nodoc
class __$PanelTicketDetailCopyWithImpl<$Res>
    implements _$PanelTicketDetailCopyWith<$Res> {
  __$PanelTicketDetailCopyWithImpl(this._self, this._then);

  final _PanelTicketDetail _self;
  final $Res Function(_PanelTicketDetail) _then;

/// Create a copy of PanelTicketDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? subject = freezed,Object? level = freezed,Object? status = freezed,Object? createdAt = freezed,Object? message = null,}) {
  return _then(_PanelTicketDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as List<PanelTicketMessage>,
  ));
}


}


/// @nodoc
mixin _$PanelTrafficRecord {

 int? get u; int? get d;@JsonKey(name: 'record_at') int? get recordAt;@JsonKey(name: 'server_rate', fromJson: _rateFromJson) double? get serverRate;
/// Create a copy of PanelTrafficRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelTrafficRecordCopyWith<PanelTrafficRecord> get copyWith => _$PanelTrafficRecordCopyWithImpl<PanelTrafficRecord>(this as PanelTrafficRecord, _$identity);

  /// Serializes this PanelTrafficRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelTrafficRecord&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.recordAt, recordAt) || other.recordAt == recordAt)&&(identical(other.serverRate, serverRate) || other.serverRate == serverRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,u,d,recordAt,serverRate);

@override
String toString() {
  return 'PanelTrafficRecord(u: $u, d: $d, recordAt: $recordAt, serverRate: $serverRate)';
}


}

/// @nodoc
abstract mixin class $PanelTrafficRecordCopyWith<$Res>  {
  factory $PanelTrafficRecordCopyWith(PanelTrafficRecord value, $Res Function(PanelTrafficRecord) _then) = _$PanelTrafficRecordCopyWithImpl;
@useResult
$Res call({
 int? u, int? d,@JsonKey(name: 'record_at') int? recordAt,@JsonKey(name: 'server_rate', fromJson: _rateFromJson) double? serverRate
});




}
/// @nodoc
class _$PanelTrafficRecordCopyWithImpl<$Res>
    implements $PanelTrafficRecordCopyWith<$Res> {
  _$PanelTrafficRecordCopyWithImpl(this._self, this._then);

  final PanelTrafficRecord _self;
  final $Res Function(PanelTrafficRecord) _then;

/// Create a copy of PanelTrafficRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? u = freezed,Object? d = freezed,Object? recordAt = freezed,Object? serverRate = freezed,}) {
  return _then(_self.copyWith(
u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,recordAt: freezed == recordAt ? _self.recordAt : recordAt // ignore: cast_nullable_to_non_nullable
as int?,serverRate: freezed == serverRate ? _self.serverRate : serverRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelTrafficRecord].
extension PanelTrafficRecordPatterns on PanelTrafficRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelTrafficRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelTrafficRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelTrafficRecord value)  $default,){
final _that = this;
switch (_that) {
case _PanelTrafficRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelTrafficRecord value)?  $default,){
final _that = this;
switch (_that) {
case _PanelTrafficRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? u,  int? d, @JsonKey(name: 'record_at')  int? recordAt, @JsonKey(name: 'server_rate', fromJson: _rateFromJson)  double? serverRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelTrafficRecord() when $default != null:
return $default(_that.u,_that.d,_that.recordAt,_that.serverRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? u,  int? d, @JsonKey(name: 'record_at')  int? recordAt, @JsonKey(name: 'server_rate', fromJson: _rateFromJson)  double? serverRate)  $default,) {final _that = this;
switch (_that) {
case _PanelTrafficRecord():
return $default(_that.u,_that.d,_that.recordAt,_that.serverRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? u,  int? d, @JsonKey(name: 'record_at')  int? recordAt, @JsonKey(name: 'server_rate', fromJson: _rateFromJson)  double? serverRate)?  $default,) {final _that = this;
switch (_that) {
case _PanelTrafficRecord() when $default != null:
return $default(_that.u,_that.d,_that.recordAt,_that.serverRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelTrafficRecord implements PanelTrafficRecord {
  const _PanelTrafficRecord({this.u, this.d, @JsonKey(name: 'record_at') this.recordAt, @JsonKey(name: 'server_rate', fromJson: _rateFromJson) this.serverRate});
  factory _PanelTrafficRecord.fromJson(Map<String, dynamic> json) => _$PanelTrafficRecordFromJson(json);

@override final  int? u;
@override final  int? d;
@override@JsonKey(name: 'record_at') final  int? recordAt;
@override@JsonKey(name: 'server_rate', fromJson: _rateFromJson) final  double? serverRate;

/// Create a copy of PanelTrafficRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelTrafficRecordCopyWith<_PanelTrafficRecord> get copyWith => __$PanelTrafficRecordCopyWithImpl<_PanelTrafficRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelTrafficRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelTrafficRecord&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.recordAt, recordAt) || other.recordAt == recordAt)&&(identical(other.serverRate, serverRate) || other.serverRate == serverRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,u,d,recordAt,serverRate);

@override
String toString() {
  return 'PanelTrafficRecord(u: $u, d: $d, recordAt: $recordAt, serverRate: $serverRate)';
}


}

/// @nodoc
abstract mixin class _$PanelTrafficRecordCopyWith<$Res> implements $PanelTrafficRecordCopyWith<$Res> {
  factory _$PanelTrafficRecordCopyWith(_PanelTrafficRecord value, $Res Function(_PanelTrafficRecord) _then) = __$PanelTrafficRecordCopyWithImpl;
@override @useResult
$Res call({
 int? u, int? d,@JsonKey(name: 'record_at') int? recordAt,@JsonKey(name: 'server_rate', fromJson: _rateFromJson) double? serverRate
});




}
/// @nodoc
class __$PanelTrafficRecordCopyWithImpl<$Res>
    implements _$PanelTrafficRecordCopyWith<$Res> {
  __$PanelTrafficRecordCopyWithImpl(this._self, this._then);

  final _PanelTrafficRecord _self;
  final $Res Function(_PanelTrafficRecord) _then;

/// Create a copy of PanelTrafficRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? u = freezed,Object? d = freezed,Object? recordAt = freezed,Object? serverRate = freezed,}) {
  return _then(_PanelTrafficRecord(
u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,recordAt: freezed == recordAt ? _self.recordAt : recordAt // ignore: cast_nullable_to_non_nullable
as int?,serverRate: freezed == serverRate ? _self.serverRate : serverRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PanelInviteCode {

 String? get code;@JsonKey(name: 'created_at') int? get createdAt;
/// Create a copy of PanelInviteCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelInviteCodeCopyWith<PanelInviteCode> get copyWith => _$PanelInviteCodeCopyWithImpl<PanelInviteCode>(this as PanelInviteCode, _$identity);

  /// Serializes this PanelInviteCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelInviteCode&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,createdAt);

@override
String toString() {
  return 'PanelInviteCode(code: $code, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PanelInviteCodeCopyWith<$Res>  {
  factory $PanelInviteCodeCopyWith(PanelInviteCode value, $Res Function(PanelInviteCode) _then) = _$PanelInviteCodeCopyWithImpl;
@useResult
$Res call({
 String? code,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class _$PanelInviteCodeCopyWithImpl<$Res>
    implements $PanelInviteCodeCopyWith<$Res> {
  _$PanelInviteCodeCopyWithImpl(this._self, this._then);

  final PanelInviteCode _self;
  final $Res Function(PanelInviteCode) _then;

/// Create a copy of PanelInviteCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelInviteCode].
extension PanelInviteCodePatterns on PanelInviteCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelInviteCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelInviteCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelInviteCode value)  $default,){
final _that = this;
switch (_that) {
case _PanelInviteCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelInviteCode value)?  $default,){
final _that = this;
switch (_that) {
case _PanelInviteCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? code, @JsonKey(name: 'created_at')  int? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelInviteCode() when $default != null:
return $default(_that.code,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? code, @JsonKey(name: 'created_at')  int? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PanelInviteCode():
return $default(_that.code,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? code, @JsonKey(name: 'created_at')  int? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PanelInviteCode() when $default != null:
return $default(_that.code,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelInviteCode implements PanelInviteCode {
  const _PanelInviteCode({this.code, @JsonKey(name: 'created_at') this.createdAt});
  factory _PanelInviteCode.fromJson(Map<String, dynamic> json) => _$PanelInviteCodeFromJson(json);

@override final  String? code;
@override@JsonKey(name: 'created_at') final  int? createdAt;

/// Create a copy of PanelInviteCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelInviteCodeCopyWith<_PanelInviteCode> get copyWith => __$PanelInviteCodeCopyWithImpl<_PanelInviteCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelInviteCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelInviteCode&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,createdAt);

@override
String toString() {
  return 'PanelInviteCode(code: $code, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PanelInviteCodeCopyWith<$Res> implements $PanelInviteCodeCopyWith<$Res> {
  factory _$PanelInviteCodeCopyWith(_PanelInviteCode value, $Res Function(_PanelInviteCode) _then) = __$PanelInviteCodeCopyWithImpl;
@override @useResult
$Res call({
 String? code,@JsonKey(name: 'created_at') int? createdAt
});




}
/// @nodoc
class __$PanelInviteCodeCopyWithImpl<$Res>
    implements _$PanelInviteCodeCopyWith<$Res> {
  __$PanelInviteCodeCopyWithImpl(this._self, this._then);

  final _PanelInviteCode _self;
  final $Res Function(_PanelInviteCode) _then;

/// Create a copy of PanelInviteCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? createdAt = freezed,}) {
  return _then(_PanelInviteCode(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PanelInvite {

 List<PanelInviteCode> get codes; List<int> get stat;
/// Create a copy of PanelInvite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelInviteCopyWith<PanelInvite> get copyWith => _$PanelInviteCopyWithImpl<PanelInvite>(this as PanelInvite, _$identity);

  /// Serializes this PanelInvite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelInvite&&const DeepCollectionEquality().equals(other.codes, codes)&&const DeepCollectionEquality().equals(other.stat, stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(codes),const DeepCollectionEquality().hash(stat));

@override
String toString() {
  return 'PanelInvite(codes: $codes, stat: $stat)';
}


}

/// @nodoc
abstract mixin class $PanelInviteCopyWith<$Res>  {
  factory $PanelInviteCopyWith(PanelInvite value, $Res Function(PanelInvite) _then) = _$PanelInviteCopyWithImpl;
@useResult
$Res call({
 List<PanelInviteCode> codes, List<int> stat
});




}
/// @nodoc
class _$PanelInviteCopyWithImpl<$Res>
    implements $PanelInviteCopyWith<$Res> {
  _$PanelInviteCopyWithImpl(this._self, this._then);

  final PanelInvite _self;
  final $Res Function(PanelInvite) _then;

/// Create a copy of PanelInvite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codes = null,Object? stat = null,}) {
  return _then(_self.copyWith(
codes: null == codes ? _self.codes : codes // ignore: cast_nullable_to_non_nullable
as List<PanelInviteCode>,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [PanelInvite].
extension PanelInvitePatterns on PanelInvite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelInvite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelInvite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelInvite value)  $default,){
final _that = this;
switch (_that) {
case _PanelInvite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelInvite value)?  $default,){
final _that = this;
switch (_that) {
case _PanelInvite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PanelInviteCode> codes,  List<int> stat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelInvite() when $default != null:
return $default(_that.codes,_that.stat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PanelInviteCode> codes,  List<int> stat)  $default,) {final _that = this;
switch (_that) {
case _PanelInvite():
return $default(_that.codes,_that.stat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PanelInviteCode> codes,  List<int> stat)?  $default,) {final _that = this;
switch (_that) {
case _PanelInvite() when $default != null:
return $default(_that.codes,_that.stat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelInvite implements PanelInvite {
  const _PanelInvite({final  List<PanelInviteCode> codes = const [], final  List<int> stat = const []}): _codes = codes,_stat = stat;
  factory _PanelInvite.fromJson(Map<String, dynamic> json) => _$PanelInviteFromJson(json);

 final  List<PanelInviteCode> _codes;
@override@JsonKey() List<PanelInviteCode> get codes {
  if (_codes is EqualUnmodifiableListView) return _codes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codes);
}

 final  List<int> _stat;
@override@JsonKey() List<int> get stat {
  if (_stat is EqualUnmodifiableListView) return _stat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stat);
}


/// Create a copy of PanelInvite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelInviteCopyWith<_PanelInvite> get copyWith => __$PanelInviteCopyWithImpl<_PanelInvite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelInviteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelInvite&&const DeepCollectionEquality().equals(other._codes, _codes)&&const DeepCollectionEquality().equals(other._stat, _stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_codes),const DeepCollectionEquality().hash(_stat));

@override
String toString() {
  return 'PanelInvite(codes: $codes, stat: $stat)';
}


}

/// @nodoc
abstract mixin class _$PanelInviteCopyWith<$Res> implements $PanelInviteCopyWith<$Res> {
  factory _$PanelInviteCopyWith(_PanelInvite value, $Res Function(_PanelInvite) _then) = __$PanelInviteCopyWithImpl;
@override @useResult
$Res call({
 List<PanelInviteCode> codes, List<int> stat
});




}
/// @nodoc
class __$PanelInviteCopyWithImpl<$Res>
    implements _$PanelInviteCopyWith<$Res> {
  __$PanelInviteCopyWithImpl(this._self, this._then);

  final _PanelInvite _self;
  final $Res Function(_PanelInvite) _then;

/// Create a copy of PanelInvite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codes = null,Object? stat = null,}) {
  return _then(_PanelInvite(
codes: null == codes ? _self._codes : codes // ignore: cast_nullable_to_non_nullable
as List<PanelInviteCode>,stat: null == stat ? _self._stat : stat // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$PanelUserInfo {

 int? get id; String? get email;@JsonKey(name: 'transfer_enable') int? get transferEnable; int? get u; int? get d;@JsonKey(name: 'expired_at') int? get expiredAt;@JsonKey(name: 'device_limit') int? get deviceLimit; int? get balance;@JsonKey(name: 'commission_balance') int? get commissionBalance; PanelPlan? get plan;
/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelUserInfoCopyWith<PanelUserInfo> get copyWith => _$PanelUserInfoCopyWithImpl<PanelUserInfo>(this as PanelUserInfo, _$identity);

  /// Serializes this PanelUserInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelUserInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance)&&(identical(other.plan, plan) || other.plan == plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,transferEnable,u,d,expiredAt,deviceLimit,balance,commissionBalance,plan);

@override
String toString() {
  return 'PanelUserInfo(id: $id, email: $email, transferEnable: $transferEnable, u: $u, d: $d, expiredAt: $expiredAt, deviceLimit: $deviceLimit, balance: $balance, commissionBalance: $commissionBalance, plan: $plan)';
}


}

/// @nodoc
abstract mixin class $PanelUserInfoCopyWith<$Res>  {
  factory $PanelUserInfoCopyWith(PanelUserInfo value, $Res Function(PanelUserInfo) _then) = _$PanelUserInfoCopyWithImpl;
@useResult
$Res call({
 int? id, String? email,@JsonKey(name: 'transfer_enable') int? transferEnable, int? u, int? d,@JsonKey(name: 'expired_at') int? expiredAt,@JsonKey(name: 'device_limit') int? deviceLimit, int? balance,@JsonKey(name: 'commission_balance') int? commissionBalance, PanelPlan? plan
});


$PanelPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class _$PanelUserInfoCopyWithImpl<$Res>
    implements $PanelUserInfoCopyWith<$Res> {
  _$PanelUserInfoCopyWithImpl(this._self, this._then);

  final PanelUserInfo _self;
  final $Res Function(PanelUserInfo) _then;

/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? transferEnable = freezed,Object? u = freezed,Object? d = freezed,Object? expiredAt = freezed,Object? deviceLimit = freezed,Object? balance = freezed,Object? commissionBalance = freezed,Object? plan = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,commissionBalance: freezed == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PanelPlan?,
  ));
}
/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PanelPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $PanelPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [PanelUserInfo].
extension PanelUserInfoPatterns on PanelUserInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelUserInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelUserInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelUserInfo value)  $default,){
final _that = this;
switch (_that) {
case _PanelUserInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelUserInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PanelUserInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? email, @JsonKey(name: 'transfer_enable')  int? transferEnable,  int? u,  int? d, @JsonKey(name: 'expired_at')  int? expiredAt, @JsonKey(name: 'device_limit')  int? deviceLimit,  int? balance, @JsonKey(name: 'commission_balance')  int? commissionBalance,  PanelPlan? plan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelUserInfo() when $default != null:
return $default(_that.id,_that.email,_that.transferEnable,_that.u,_that.d,_that.expiredAt,_that.deviceLimit,_that.balance,_that.commissionBalance,_that.plan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? email, @JsonKey(name: 'transfer_enable')  int? transferEnable,  int? u,  int? d, @JsonKey(name: 'expired_at')  int? expiredAt, @JsonKey(name: 'device_limit')  int? deviceLimit,  int? balance, @JsonKey(name: 'commission_balance')  int? commissionBalance,  PanelPlan? plan)  $default,) {final _that = this;
switch (_that) {
case _PanelUserInfo():
return $default(_that.id,_that.email,_that.transferEnable,_that.u,_that.d,_that.expiredAt,_that.deviceLimit,_that.balance,_that.commissionBalance,_that.plan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? email, @JsonKey(name: 'transfer_enable')  int? transferEnable,  int? u,  int? d, @JsonKey(name: 'expired_at')  int? expiredAt, @JsonKey(name: 'device_limit')  int? deviceLimit,  int? balance, @JsonKey(name: 'commission_balance')  int? commissionBalance,  PanelPlan? plan)?  $default,) {final _that = this;
switch (_that) {
case _PanelUserInfo() when $default != null:
return $default(_that.id,_that.email,_that.transferEnable,_that.u,_that.d,_that.expiredAt,_that.deviceLimit,_that.balance,_that.commissionBalance,_that.plan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelUserInfo implements PanelUserInfo {
  const _PanelUserInfo({this.id, this.email, @JsonKey(name: 'transfer_enable') this.transferEnable, this.u, this.d, @JsonKey(name: 'expired_at') this.expiredAt, @JsonKey(name: 'device_limit') this.deviceLimit, this.balance, @JsonKey(name: 'commission_balance') this.commissionBalance, this.plan});
  factory _PanelUserInfo.fromJson(Map<String, dynamic> json) => _$PanelUserInfoFromJson(json);

@override final  int? id;
@override final  String? email;
@override@JsonKey(name: 'transfer_enable') final  int? transferEnable;
@override final  int? u;
@override final  int? d;
@override@JsonKey(name: 'expired_at') final  int? expiredAt;
@override@JsonKey(name: 'device_limit') final  int? deviceLimit;
@override final  int? balance;
@override@JsonKey(name: 'commission_balance') final  int? commissionBalance;
@override final  PanelPlan? plan;

/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelUserInfoCopyWith<_PanelUserInfo> get copyWith => __$PanelUserInfoCopyWithImpl<_PanelUserInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelUserInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelUserInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.commissionBalance, commissionBalance) || other.commissionBalance == commissionBalance)&&(identical(other.plan, plan) || other.plan == plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,transferEnable,u,d,expiredAt,deviceLimit,balance,commissionBalance,plan);

@override
String toString() {
  return 'PanelUserInfo(id: $id, email: $email, transferEnable: $transferEnable, u: $u, d: $d, expiredAt: $expiredAt, deviceLimit: $deviceLimit, balance: $balance, commissionBalance: $commissionBalance, plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$PanelUserInfoCopyWith<$Res> implements $PanelUserInfoCopyWith<$Res> {
  factory _$PanelUserInfoCopyWith(_PanelUserInfo value, $Res Function(_PanelUserInfo) _then) = __$PanelUserInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? email,@JsonKey(name: 'transfer_enable') int? transferEnable, int? u, int? d,@JsonKey(name: 'expired_at') int? expiredAt,@JsonKey(name: 'device_limit') int? deviceLimit, int? balance,@JsonKey(name: 'commission_balance') int? commissionBalance, PanelPlan? plan
});


@override $PanelPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class __$PanelUserInfoCopyWithImpl<$Res>
    implements _$PanelUserInfoCopyWith<$Res> {
  __$PanelUserInfoCopyWithImpl(this._self, this._then);

  final _PanelUserInfo _self;
  final $Res Function(_PanelUserInfo) _then;

/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? transferEnable = freezed,Object? u = freezed,Object? d = freezed,Object? expiredAt = freezed,Object? deviceLimit = freezed,Object? balance = freezed,Object? commissionBalance = freezed,Object? plan = freezed,}) {
  return _then(_PanelUserInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,commissionBalance: freezed == commissionBalance ? _self.commissionBalance : commissionBalance // ignore: cast_nullable_to_non_nullable
as int?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PanelPlan?,
  ));
}

/// Create a copy of PanelUserInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PanelPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $PanelPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// @nodoc
mixin _$PanelSubscribeInfo {

 PanelPlan? get plan;@JsonKey(name: 'subscribe_url') String? get subscribeUrl;@JsonKey(name: 'expired_at') int? get expiredAt; int? get u; int? get d;@JsonKey(name: 'transfer_enable') int? get transferEnable;@JsonKey(name: 'reset_day') int? get resetDay;@JsonKey(name: 'device_limit') int? get deviceLimit;
/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanelSubscribeInfoCopyWith<PanelSubscribeInfo> get copyWith => _$PanelSubscribeInfoCopyWithImpl<PanelSubscribeInfo>(this as PanelSubscribeInfo, _$identity);

  /// Serializes this PanelSubscribeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanelSubscribeInfo&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.subscribeUrl, subscribeUrl) || other.subscribeUrl == subscribeUrl)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.resetDay, resetDay) || other.resetDay == resetDay)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plan,subscribeUrl,expiredAt,u,d,transferEnable,resetDay,deviceLimit);

@override
String toString() {
  return 'PanelSubscribeInfo(plan: $plan, subscribeUrl: $subscribeUrl, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, resetDay: $resetDay, deviceLimit: $deviceLimit)';
}


}

/// @nodoc
abstract mixin class $PanelSubscribeInfoCopyWith<$Res>  {
  factory $PanelSubscribeInfoCopyWith(PanelSubscribeInfo value, $Res Function(PanelSubscribeInfo) _then) = _$PanelSubscribeInfoCopyWithImpl;
@useResult
$Res call({
 PanelPlan? plan,@JsonKey(name: 'subscribe_url') String? subscribeUrl,@JsonKey(name: 'expired_at') int? expiredAt, int? u, int? d,@JsonKey(name: 'transfer_enable') int? transferEnable,@JsonKey(name: 'reset_day') int? resetDay,@JsonKey(name: 'device_limit') int? deviceLimit
});


$PanelPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class _$PanelSubscribeInfoCopyWithImpl<$Res>
    implements $PanelSubscribeInfoCopyWith<$Res> {
  _$PanelSubscribeInfoCopyWithImpl(this._self, this._then);

  final PanelSubscribeInfo _self;
  final $Res Function(PanelSubscribeInfo) _then;

/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = freezed,Object? subscribeUrl = freezed,Object? expiredAt = freezed,Object? u = freezed,Object? d = freezed,Object? transferEnable = freezed,Object? resetDay = freezed,Object? deviceLimit = freezed,}) {
  return _then(_self.copyWith(
plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PanelPlan?,subscribeUrl: freezed == subscribeUrl ? _self.subscribeUrl : subscribeUrl // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,resetDay: freezed == resetDay ? _self.resetDay : resetDay // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PanelPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $PanelPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [PanelSubscribeInfo].
extension PanelSubscribeInfoPatterns on PanelSubscribeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanelSubscribeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanelSubscribeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanelSubscribeInfo value)  $default,){
final _that = this;
switch (_that) {
case _PanelSubscribeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanelSubscribeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PanelSubscribeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PanelPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'expired_at')  int? expiredAt,  int? u,  int? d, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'reset_day')  int? resetDay, @JsonKey(name: 'device_limit')  int? deviceLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanelSubscribeInfo() when $default != null:
return $default(_that.plan,_that.subscribeUrl,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.resetDay,_that.deviceLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PanelPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'expired_at')  int? expiredAt,  int? u,  int? d, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'reset_day')  int? resetDay, @JsonKey(name: 'device_limit')  int? deviceLimit)  $default,) {final _that = this;
switch (_that) {
case _PanelSubscribeInfo():
return $default(_that.plan,_that.subscribeUrl,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.resetDay,_that.deviceLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PanelPlan? plan, @JsonKey(name: 'subscribe_url')  String? subscribeUrl, @JsonKey(name: 'expired_at')  int? expiredAt,  int? u,  int? d, @JsonKey(name: 'transfer_enable')  int? transferEnable, @JsonKey(name: 'reset_day')  int? resetDay, @JsonKey(name: 'device_limit')  int? deviceLimit)?  $default,) {final _that = this;
switch (_that) {
case _PanelSubscribeInfo() when $default != null:
return $default(_that.plan,_that.subscribeUrl,_that.expiredAt,_that.u,_that.d,_that.transferEnable,_that.resetDay,_that.deviceLimit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanelSubscribeInfo implements PanelSubscribeInfo {
  const _PanelSubscribeInfo({this.plan, @JsonKey(name: 'subscribe_url') this.subscribeUrl, @JsonKey(name: 'expired_at') this.expiredAt, this.u, this.d, @JsonKey(name: 'transfer_enable') this.transferEnable, @JsonKey(name: 'reset_day') this.resetDay, @JsonKey(name: 'device_limit') this.deviceLimit});
  factory _PanelSubscribeInfo.fromJson(Map<String, dynamic> json) => _$PanelSubscribeInfoFromJson(json);

@override final  PanelPlan? plan;
@override@JsonKey(name: 'subscribe_url') final  String? subscribeUrl;
@override@JsonKey(name: 'expired_at') final  int? expiredAt;
@override final  int? u;
@override final  int? d;
@override@JsonKey(name: 'transfer_enable') final  int? transferEnable;
@override@JsonKey(name: 'reset_day') final  int? resetDay;
@override@JsonKey(name: 'device_limit') final  int? deviceLimit;

/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanelSubscribeInfoCopyWith<_PanelSubscribeInfo> get copyWith => __$PanelSubscribeInfoCopyWithImpl<_PanelSubscribeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanelSubscribeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanelSubscribeInfo&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.subscribeUrl, subscribeUrl) || other.subscribeUrl == subscribeUrl)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.u, u) || other.u == u)&&(identical(other.d, d) || other.d == d)&&(identical(other.transferEnable, transferEnable) || other.transferEnable == transferEnable)&&(identical(other.resetDay, resetDay) || other.resetDay == resetDay)&&(identical(other.deviceLimit, deviceLimit) || other.deviceLimit == deviceLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plan,subscribeUrl,expiredAt,u,d,transferEnable,resetDay,deviceLimit);

@override
String toString() {
  return 'PanelSubscribeInfo(plan: $plan, subscribeUrl: $subscribeUrl, expiredAt: $expiredAt, u: $u, d: $d, transferEnable: $transferEnable, resetDay: $resetDay, deviceLimit: $deviceLimit)';
}


}

/// @nodoc
abstract mixin class _$PanelSubscribeInfoCopyWith<$Res> implements $PanelSubscribeInfoCopyWith<$Res> {
  factory _$PanelSubscribeInfoCopyWith(_PanelSubscribeInfo value, $Res Function(_PanelSubscribeInfo) _then) = __$PanelSubscribeInfoCopyWithImpl;
@override @useResult
$Res call({
 PanelPlan? plan,@JsonKey(name: 'subscribe_url') String? subscribeUrl,@JsonKey(name: 'expired_at') int? expiredAt, int? u, int? d,@JsonKey(name: 'transfer_enable') int? transferEnable,@JsonKey(name: 'reset_day') int? resetDay,@JsonKey(name: 'device_limit') int? deviceLimit
});


@override $PanelPlanCopyWith<$Res>? get plan;

}
/// @nodoc
class __$PanelSubscribeInfoCopyWithImpl<$Res>
    implements _$PanelSubscribeInfoCopyWith<$Res> {
  __$PanelSubscribeInfoCopyWithImpl(this._self, this._then);

  final _PanelSubscribeInfo _self;
  final $Res Function(_PanelSubscribeInfo) _then;

/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = freezed,Object? subscribeUrl = freezed,Object? expiredAt = freezed,Object? u = freezed,Object? d = freezed,Object? transferEnable = freezed,Object? resetDay = freezed,Object? deviceLimit = freezed,}) {
  return _then(_PanelSubscribeInfo(
plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PanelPlan?,subscribeUrl: freezed == subscribeUrl ? _self.subscribeUrl : subscribeUrl // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int?,u: freezed == u ? _self.u : u // ignore: cast_nullable_to_non_nullable
as int?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as int?,transferEnable: freezed == transferEnable ? _self.transferEnable : transferEnable // ignore: cast_nullable_to_non_nullable
as int?,resetDay: freezed == resetDay ? _self.resetDay : resetDay // ignore: cast_nullable_to_non_nullable
as int?,deviceLimit: freezed == deviceLimit ? _self.deviceLimit : deviceLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of PanelSubscribeInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PanelPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $PanelPlanCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}

// dart format on
