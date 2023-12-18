import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_stacked/models/posts_list.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  static const endPoint = 'https://dummyapi.io/data/v1';

  static const testApi = "https://jsonplaceholder.typicode.com/posts";

  static String appID = "65731eaf869af34e08b0974a";

  var client = http.Client();

  Map<String, String> requestHeaders = {'app-id': appID};

  Future<List<UsersList>> getListofUsers() async {
    var url = Uri.parse('$endPoint/user');
    List<UsersList> usersList = [];
    try {
      var response = await client.get(
        url,
        headers: {'app-id': appID},
      );
      dynamic parsed;
      try {
        parsed = json.decode(response.body);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      for (var comment in parsed['data']) {
        usersList.add(UsersList.fromJson(comment));
      }
    } catch (e) {
      //
    }

    return usersList;
  }

  Future<User> getUserByID(String userID) async {
    var url = Uri.parse('$endPoint/user/$userID');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return User.fromJson(jsonDecode(response.body));
  }

  Future<List<PostsList>> getListOfPosts() async {
    var url = Uri.parse('$endPoint/post');
    List<PostsList> postsList = [];

    var response = await client.get(
      url,
      headers: {'app-id': appID},
    );
    dynamic parsed;
    try {
      parsed = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    for (var comment in parsed['data']) {
      postsList.add(PostsList.fromJson(comment));
    }
    return postsList;
  }

  Future<List<PostsList>> getUserPosts(String userID) async {
    var url = Uri.parse('$endPoint/post');
    List<PostsList> postsList = [];

    var response = await client.get(
      url,
      headers: {'app-id': appID},
    );
    dynamic parsed;
    try {
      parsed = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    for (var comment in parsed['data']) {
      postsList.add(PostsList.fromJson(comment));
    }
    return postsList;
  }
}
