import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final String? locationName;
  final String? tagLine;
  final String? description;
  final List<String>? images;
  final String? distance;

  //constructor
  const LocationModel({
    required this.description,
    required this.distance,
    required this.images,
    required this.locationName,
    required this.tagLine,
  });

  //from json method
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      description: json['description'],
      distance: json['distance_from_roorkee_km'],
      images: json['image_links'],
      locationName: json['location_name'],
      tagLine: json['tag_line'],
    );
  }

  @override
  List<Object?> get props => [
        locationName,
        tagLine,
        description,
        images,
        distance,
      ];
}
