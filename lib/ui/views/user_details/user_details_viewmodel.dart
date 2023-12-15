import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class UserDetailsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  late User _userDeatils;

  final dateFormat =  DateFormat('dd-MMM-yyy hh:mm');

  Future<User> getUserDetails(String userID) async {
    _userDeatils = await _apiService.getUserByID(userID);
    return _userDeatils;
  }
}
