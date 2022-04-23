import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../blocs/location_bloc/location_bloc.dart';
import '../../data/models/user_location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  /// Map page

  // Google maps controller
  GoogleMapController? mapController;

  // Location data object
  Location location = Location();

  // Marker to save the currentLocation
  Marker? marker;

  // Map style holder
  String? _mapStyle;

  /// Function to save initial location
  Future<void> saveInitialLocation(BuildContext context) async {
    final LocationData currentLocation = await location.getLocation();

    // add to bloc
    context.read<LocationBloc>().add(UpdateLocationEvent(
        userLocation: UserLocation(
            latitude: currentLocation.latitude!,
            longitude: currentLocation.longitude!)));
  }

  @override
  void initState() {
    super.initState();

    // Load map styles from file
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    // Add bloc event to log user in
    context.read<LocationBloc>().add(LoginEvent());

    // Get current location and add it to bloc
    saveInitialLocation(context);

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Update map camera to new location
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation.latitude!,
              currentLocation.longitude!,
            ),
            zoom: 16.0,
          ),
        ),
      );

      // Update current location in bloc
      context.read<LocationBloc>().add(UpdateLocationEvent(
          userLocation: UserLocation(
              longitude: currentLocation.longitude!,
              latitude: currentLocation.latitude!)));
    });

    // Run code that uploads user current location to firestore every 15 minutes
    Timer.periodic(const Duration(minutes: 15), (Timer timer) {
      context.read<LocationBloc>().add(UploadEvent());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Uploading location'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (BuildContext context, LocationState state) {
            // Show loading if user location is not yet detected
            return state.userLocation == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;

                      // Set map style in controller

                      mapController!.setMapStyle(_mapStyle);
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(state.userLocation!.latitude,
                            state.userLocation!.longitude),
                        zoom: 16.0),
                    myLocationEnabled: true,
                  );
          },
        ),
      ),
    );
  }
}
