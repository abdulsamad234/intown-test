part of 'location_bloc.dart';

@immutable
abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Login user event
class LoginEvent extends LocationEvent {}

/// Update current user location event
class UpdateLocationEvent extends LocationEvent {
  const UpdateLocationEvent({required this.userLocation});
  final UserLocation userLocation;

  @override
  List<Object> get props => <Object>[userLocation];
}

/// Upload to firestore event
class UploadEvent extends LocationEvent {}
