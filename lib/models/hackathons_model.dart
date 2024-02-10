import 'dart:convert';

import 'package:http/http.dart' as http;




class Hackathon {
  String name;
  String type;
  String date;
  String description;
  String drive;
  String thumbnail;
  int id;

  Hackathon({
    required this.name,
    required this.type,
    required this.date,
    required this.description,
    required this.drive,
    required this.thumbnail,
    required this.id,
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) {
    return Hackathon(
      name: json['name'],
      type: json['type'],
      date: json['date'],
      description: json['description'],
      drive: json['drive'],
      thumbnail: json['thumbnail'],
      id: json['id'],
    );
  }

static Future<List<Hackathon>> fetchHackathons() async {
  final response = await http.get(
      Uri.parse('https://ghach-rest-api.onrender.com/v1/events'));
  if (response.statusCode == 200) {
    List<Hackathon> hackathons = [];
    for (var json in jsonDecode(response.body)) {
      hackathons.add(Hackathon.fromJson(json));
    }
    return hackathons;
  } else {
    throw Exception('Failed to load hackathons');
  }
}

  static Future<Hackathon> fetchHackathon(int id) async {
    final response = await http.get(
        Uri.parse('https://ghach-rest-api.onrender.com/v1/events/$id'));
    if (response.statusCode == 200) {
      return Hackathon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load hackathon');
    }
  }

  // static Future<void> createHackathon(Hackathon hackathon) async {
  //   final response = await http.post(
  //     Uri.parse('https://ghach-rest-api.onrender.com/v1/events'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: hackathon.toJson(),
  //   );
  //   if (response.statusCode != 201) {
  //     throw Exception('Failed to create hackathon');
  //   }
  // }

  // static Future<void> updateHackathon(Hackathon hackathon) async {
  //   final response = await http.put(
  //     Uri.parse(
  //         'https://hackathon-portal.herokuapp.com/hackathons/${hackathon.id}'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: hackathon.toJson(),
  //   );
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to update hackathon');
  //   }
  // }

  // static Future<void> deleteHackathon(int id) async {
  //   final response = await http.delete(
  //       Uri.parse('https://hackathon-portal.herokuapp.com/hackathons/$id'));
  //   if (response.statusCode != 204) {
  //     throw Exception('Failed to delete hackathon');
  //   }
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'date': date,
      'description': description,
      'drive': drive,
      'thumbnail': thumbnail,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'Hackathon{name: $name, type: $type, date: $date, description: $description, drive: $drive, thumbnail: $thumbnail, id: $id}';
  }
}