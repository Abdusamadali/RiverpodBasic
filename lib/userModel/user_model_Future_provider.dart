import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final userApi = userApiFromJson(jsonString);

import 'dart:convert';

List<UserApi> userApiFromJson(String str) => List<UserApi>.from(json.decode(str).map((x) => UserApi.fromJson(x)));

String userApiToJson(List<UserApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserApi {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserApi({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toJson(),
    "phone": phone,
    "website": website,
    "company": company?.toJson(),
  };
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo?.toJson(),
  };
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}


class UserRepo{


  // fetching data from
  Future<List<UserApi>> fetchUser()async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response =await http.get(url);
    fetchUser2();
    if(response.statusCode ==200){
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((e) => UserApi.fromJson(e)).toList();
    }else{
      throw Exception('Failed to load users');
    }

  }
  void fetchUser2()async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    final decode = jsonDecode(response.body);
    List<dynamic> data = decode.map((e)=>UserApi.fromJson(e)).toList();
    if(response.statusCode==200){
      print(data[9].name.toString()+'---------------------------------hello');
    }else{
      print("data not found");
    }


  }
}