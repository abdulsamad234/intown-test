// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocationStateCWProxy {
  LocationState userLocation(UserLocation? userLocation);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocationState call({
    UserLocation? userLocation,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocationState.copyWith.fieldName(...)`
class _$LocationStateCWProxyImpl implements _$LocationStateCWProxy {
  final LocationState _value;

  const _$LocationStateCWProxyImpl(this._value);

  @override
  LocationState userLocation(UserLocation? userLocation) =>
      this(userLocation: userLocation);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocationState call({
    Object? userLocation = const $CopyWithPlaceholder(),
  }) {
    return LocationState(
      userLocation: userLocation == const $CopyWithPlaceholder()
          ? _value.userLocation
          // ignore: cast_nullable_to_non_nullable
          : userLocation as UserLocation?,
    );
  }
}

extension $LocationStateCopyWith on LocationState {
  /// Returns a callable class that can be used as follows: `instanceOfclass LocationState extends Equatable.name.copyWith(...)` or like so:`instanceOfclass LocationState extends Equatable.name.copyWith.fieldName(...)`.
  _$LocationStateCWProxy get copyWith => _$LocationStateCWProxyImpl(this);
}
