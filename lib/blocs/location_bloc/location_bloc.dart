import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/firebase_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.firebaseRepository}) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  /// Firebase repository that consists of firebase functions
  final FirebaseRepository firebaseRepository;
}
