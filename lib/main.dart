import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/location_bloc/location_bloc.dart';
import 'data/repositories/firebase_repository.dart';
import 'firebase_options.dart';
import 'view/map/map_page.dart';

void main() async {
  //Ensure flutter widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Provide firebase repository to app
    return RepositoryProvider<FirebaseRepository>(
        create: (BuildContext context) => FirebaseRepository(),
        // Provide location bloc
        child: BlocProvider<LocationBloc>(
          create: (BuildContext context) => LocationBloc(
              firebaseRepository:
                  RepositoryProvider.of<FirebaseRepository>(context)),
          child: const MaterialApp(
            title: 'Flutter Demo',
            home: MapPage(),
          ),
        ));
  }
}
