import 'dart:convert';

UsersList usersListFromJson(String str) => UsersList.fromJson(json.decode(str));

String usersListToJson(UsersList data) => json.encode(data.toJson());

class UsersList {
  String id;
  Title title;
  String firstName;
  String lastName;
  String picture;

  UsersList({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        firstName: json["firstName"],
        lastName: json["lastName"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
      };
}

enum Title { miss, mr, mrs, ms }

final titleValues = EnumValues(
    {"miss": Title.miss, "mr": Title.mr, "mrs": Title.mrs, "ms": Title.ms});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
