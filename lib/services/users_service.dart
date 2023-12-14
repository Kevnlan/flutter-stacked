import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:flutter_application_stacked/services/locator.dart';

class UsersService {
  final _apiService = locator<ApiService>();

  Future<List<UsersList>> getArtists() async {
    // Check if user is logged in
    // if (_authenticationService.userLoggedIn()) {
    //   // Get the artists from the backend
    //   final newArtists = await _apiService.getListofUsers();

    //   // Save to the database
    //   await _databaseService.saveArtists(newArtists);

    //   return newArtists;
    // }

    throw Exception('User must be logged in to see artists');
  }

  Future<List<UsersList>> getListofUsers() async {
    final newArtists = await _apiService.getListofUsers();
    return newArtists;
  }
}
