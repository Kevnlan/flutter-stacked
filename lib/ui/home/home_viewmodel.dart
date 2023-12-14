import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:flutter_application_stacked/services/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {}

class HomeViewFuture extends FutureViewModel<List> {
  @override
  Future<List> futureToRun() => fetchArtists();

  final _apiService = locator<ApiService>();
  List<UsersList> _usersList = [];

  Future<String> getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'This is fetched from everywhere';
  }

  Future<List> fetchArtists() async {
    _usersList.clear();
    _usersList = await _apiService.getListofUsers();
    return _usersList;
  }

  @override
  void onError(error) {}
}