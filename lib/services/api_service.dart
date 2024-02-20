import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_stacked/models/images.dart';
import 'package:flutter_application_stacked/models/pixabay_images.dart';
import 'package:flutter_application_stacked/models/posts_list.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  static const endPoint = 'https://dummyapi.io/data/v1';

  static const imageEndpoint = 'https://api.pexels.com/v1';
  static const pixabayEndpoint = 'https://pixabay.com/api/';

  static const testApi = "https://jsonplaceholder.typicode.com/posts";

  static String? appID = dotenv.env['DUMMY_API_APP_ID'];
  static String apiKey = dotenv.env['API_KEY_PEXELS']!;
  static String pixabayKey = dotenv.env['API_KEY_PIXABAY']!;

  static const baseUrl = "192.168.100.122:2020";

  var client = http.Client();

  Map<String, String> requestHeaders = {'app-id': appID!};

  Future<List<UsersList>> getListofUsers() async {
    var url = Uri.parse('$endPoint/user');
    List<UsersList> usersList = [];
    try {
      var response = await client.get(
        url,
        headers: {'app-id': appID!},
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
      headers: {'app-id': appID!},
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
      headers: {'app-id': appID!},
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

  // Photos

  Future<List<Images>> getCuratedImages() async {
    var url = Uri.parse('$imageEndpoint/curated');
    List<Images> imageList = [];

    Map<String, String> headers = {'Authorization': apiKey};

    try {
      var response = await client.get(url, headers: headers);
      dynamic parsed;
      try {
        parsed = json.decode(response.body);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      for (var comment in parsed['photos']) {
        imageList.add(Images.fromJson(comment));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageList;
  }

  Future<List<PixabayImages>> getPixabayImages() async {
    var url = Uri.parse(pixabayEndpoint);
    List<PixabayImages> imageList = [];

    Map<String, String> queryParams = {
      'key': pixabayKey,
      'q': 'cars',
      'image_type': 'photo',
      'pretty': 'true',
    };

    try {
      var response =
          await client.get(url.replace(queryParameters: queryParams));
      dynamic parsed;
      try {
        parsed = json.decode(response.body);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      for (var comment in parsed['hits']) {
        imageList.add(PixabayImages.fromJson(comment));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageList;
  }
}
