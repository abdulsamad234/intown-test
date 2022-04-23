part of 'location_bloc.dart';

@immutable
abstract class LocationEvent extends Equatable{
  const LocationEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Login user event
class LoginEvent extends LocationEvent{}
