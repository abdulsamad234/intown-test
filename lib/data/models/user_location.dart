import 'dart:convert';


/// Model for user location 
class UserLocation {

  /// Constructor
  const UserLocation({
    required this.longitude,
    required this.latitude,
  });


  /// Function to create class from map
  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      longitude: double.parse('${map['longitude']}'),
      latitude: double.parse('${map['latitude']}'),
    );
  }

  /// Function to create Class from json string

  factory UserLocation.fromJson(String source) => UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);
  
  /// Class members
  final double longitude;
  final double latitude;

  /// Function to convert class to map
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{};
  
    result.addAll(<String, dynamic>{'longitude': longitude});
    result.addAll(<String, dynamic>{'latitude': latitude});
  
    return result;
  }

  /// Function to convert map to json string
  String toJson() => json.encode(toMap());
}
