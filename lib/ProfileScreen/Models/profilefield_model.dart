class ProfileFieldModel {
  String fullName;
  String country;
  String dateOfBirth;
  String city;

  ProfileFieldModel({
    required this.fullName,
    required this.country,
    required this.dateOfBirth,
    required this.city,
  });

  factory ProfileFieldModel.fromJson(Map<String, dynamic> json) {
    return ProfileFieldModel(
      fullName: json['fullName'] ?? '',
      country: json['country'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      city: json['city'] ?? '', // Handle city
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'country': country,
      'dateOfBirth': dateOfBirth,
      'city': city, // Include city when converting to JSON
    };
  }

  void updateFullName(String name) {
    fullName = name;
  }

  void updateCountry(String country) {
    this.country = country;
  }

  void updateDateOfBirth(String date) {
    dateOfBirth = date;
  }

  void updateCity(String city) {
    this.city = city; // Update city
  }
}
