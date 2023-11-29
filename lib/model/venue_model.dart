class Venue {
  String name;
  String location;
  String photo;
  List<String> amenities;

  Venue(this.name, this.location, this.photo, this.amenities);

  // Method to convert Venue object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'photo': photo,
      'amenities': amenities,
    };
  }

  // Factory method to create a Venue object from a JSON map
  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      json['name'],
      json['location'],
      json['photo'],
      List<String>.from(json['amenities']),
    );
  }

}