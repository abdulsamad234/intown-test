part of 'location_bloc.dart';

@CopyWith()
class LocationState extends Equatable {

  const LocationState({this.userLocation});
  
  // User location stored in bloc state
  final UserLocation? userLocation;

  @override
  List<Object?> get props => <Object?>[userLocation];

}
