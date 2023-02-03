import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? street2;
  String? street;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.street2,
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'street2': street2,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      street2: map['street2'] != null ? map['street2'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      zipCode: map['zipCode'] != null ? map['zipCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, street2: $street2, street: $street, city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }
}
