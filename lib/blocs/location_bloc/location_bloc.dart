import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_location.dart';
import '../../data/repositories/firebase_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.firebaseRepository})
      : super(const LocationState(
            userLocation: UserLocation(latitude: 0.0, longitude: 0.0))) {
    on<LocationEvent>((LocationEvent event, Emitter<LocationState> emit) {});

    /// When login event is added to bloc
    on<LoginEvent>((LocationEvent event, Emitter<LocationState> emit) {
      // Check if user is logged in
      if (!firebaseRepository.isUserLoggedIn()) {
        // If user isn't logged in, log them in
        firebaseRepository.signIn().then((_) {
          debugPrint('User logged in');
        }).onError((Object? error, StackTrace stackTrace) {
          debugPrint('User not logged in, error occured');
        });
      }
    });
  }

  /// Firebase repository that consists of firebase functions
  final FirebaseRepository firebaseRepository;
}
