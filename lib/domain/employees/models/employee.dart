import 'package:flutter/material.dart';

class Employee {
  String firstName;
  String lastName;
  String city;
  String street;
  Gender gender;
  String imageUrl;

  Employee({required this.firstName,
    required this.lastName,
    required this.city,
    required this.street,
    required this.imageUrl,
    required this.gender,});

  factory Employee.fromMap(Map<String, dynamic> map)
  {
    final nameJson = map['name'] as Map<String, dynamic>;
    final locationJson = map['location'] as Map<String,dynamic>;
    final streetJson = locationJson['street'] as Map<String, dynamic>;
    final gender = Gender.fromString(map['gender'] as String? ?? "");
    final pictureJson = map['picture'] as Map<String, dynamic>;
    return Employee(firstName: nameJson['first'] as String? ?? "",
        lastName: nameJson['last'] as String? ?? "",
        city: locationJson['city'] as String? ?? "",
        street: streetJson['name'] as String? ?? "",
        gender: gender,
        imageUrl: pictureJson['medium'] as String,);
  }

  @override
  String toString() {
    return 'Employee{firstName: $firstName, lastName: $lastName, city: $city, street: $street, gender: $gender, imageUrl: $imageUrl}';
  }
}

enum Gender {
  male,
  female,
  other;

  factory Gender.fromString(String value) {
    return switch (value) {
      "male" => male,
      "female" => female,
      _ => other,
    };
  }
}

extension GenderX on Gender{
  IconData getIcon() {
    return switch (this){
      Gender.male => Icons.male,
      Gender.female => Icons.female,
      _ => Icons.accessibility,
    };
  }
  Color getColor(){
    return switch (this){
      Gender.male => Colors.blue,
      Gender.female => Colors.deepPurple,
    _ => Colors.black
    };
  }
}
