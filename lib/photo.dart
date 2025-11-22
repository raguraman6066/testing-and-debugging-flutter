import 'dart:convert';
import 'package:http/http.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  int id;
  String title;
  String url;
  Photo({required this.id, required this.title, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title, 'url': url};
  }

  factory Photo.fromMap(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);
}

Future<Photo> fetchPhoto(Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos/1'),
  );
  if (response.statusCode == 200) {
    return Photo.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load photo');
  }
}
