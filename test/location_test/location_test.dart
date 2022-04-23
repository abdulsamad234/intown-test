import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_app/blocs/location_bloc/location_bloc.dart';
import 'package:map_app/data/models/user_location.dart';
import 'package:map_app/data/repositories/firebase_repository.dart';
import 'package:map_app/firebase_options.dart';

import '../firebase_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();


  //Initialize firebase
  setupFirebaseAuthMocks();
  Firebase.initializeApp();

  group('Location Bloc', () {
    late LocationBloc locationBloc;
    FirebaseRepository firebaseRepository;

    // Setup our variables for testing
    setUp(() {
      // Beautifully format bloc properties
      EquatableConfig.stringify = true;

      

      firebaseRepository = FirebaseRepository();
      locationBloc = LocationBloc(firebaseRepository: firebaseRepository);
      
      //Sign in with firebase
      firebaseRepository.signIn();
    });

    blocTest<LocationBloc, LocationState>('Test for UpdateLocation event',
        build: () => locationBloc,
        act: (LocationBloc bloc) => bloc.add(const UpdateLocationEvent(
            userLocation:
                UserLocation(latitude: 33.589886, longitude: -7.603869))),
        expect: () => <LocationState>[const LocationState(
            userLocation:
                UserLocation(latitude: 33.589886, longitude: -7.603869))]);

    // Teardown function
    tearDown(() {
      locationBloc.close();
    });
  });
}
