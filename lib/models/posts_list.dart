// To parse this JSON data, do
//
//     final postsList = postsListFromJson(jsonString);

import 'dart:convert';

PostsList postsListFromJson(String str) => PostsList.fromJson(json.decode(str));

String postsListToJson(PostsList data) => json.encode(data.toJson());

class PostsList {
  String id;
  String image;
  int likes;
  List<String> tags;
  String text;
  DateTime publishDate;
  Owner owner;

  PostsList({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.owner,
  });

  factory PostsList.fromJson(Map<String, dynamic> json) => PostsList(
        id: json["id"],
        image: json["image"],
        likes: json["likes"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        text: json["text"],
        publishDate: DateTime.parse(json["publishDate"]),
        owner: Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "likes": likes,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "text": text,
        "publishDate": publishDate.toIso8601String(),
        "owner": owner.toJson(),
      };
}

class Owner {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

  Owner({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
      };
}
