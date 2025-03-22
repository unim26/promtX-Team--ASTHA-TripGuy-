class TransportModel {
  final String? name;
  final String? source;
  final String? destination;
  final int? price;
  final String? duration;

  //construction
  TransportModel({
    required this.destination,
    required this.duration,
    required this.name,
    required this.price,
    required this.source,
  });

  //from json
  factory TransportModel.fromJson(Map<String, dynamic> json) {
    return TransportModel(
      destination: json['destination'],
      duration: json['duration'],
      name: json['name'],
      price: json['price'],
      source: json['source'],
    );
  }
}
