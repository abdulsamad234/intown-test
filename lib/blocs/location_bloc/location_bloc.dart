import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_location.dart';
import '../../data/repositories/firebase_repository.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.g.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.firebaseRepository})
      : super(const LocationState()) {
    on<LocationEvent>((LocationEvent event, Emitter<LocationState> emit) {});

    /// When login event is added to bloc
    on<LoginEvent>((LoginEvent event, Emitter<LocationState> emit) {
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

    /// When update location event is added to bloc
    on<UpdateLocationEvent>((UpdateLocationEvent event, Emitter<LocationState> emit) {
      // Check if user is logged in
      if (firebaseRepository.isUserLoggedIn()) {
        // Emit state with new current location
        emit(state.copyWith(userLocation: event.userLocation));
      }
    });

    /// When upload location event is added to bloc
    on<UploadEvent>((UploadEvent event, Emitter<LocationState> emit) {
      // Check if user is logged in
      if (firebaseRepository.isUserLoggedIn()) {
        // Upload current location
        firebaseRepository.uploadLocation(state.userLocation!, firebaseRepository.getUserId());
      }
    });
  }

  /// Firebase repository that consists of firebase functions
  final FirebaseRepository firebaseRepository;
}
