import 'package:flutter_application_stacked/app/app.bottomsheets.dart';
import 'package:flutter_application_stacked/app/app.dialogs.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:flutter_application_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

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
}

class HomeViewFuture extends FutureViewModel<List> {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool _isfetching = false;
  int _setIndex = -1;

  bool get isFetching => _isfetching;
  int get setIndex => _setIndex;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

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

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  late User _userDeatils;

  Future<User> getUserDetails(String userID) async {
    _userDeatils = await _apiService.getUserByID(userID);
    return _userDeatils;
  }

  void getUserInfo(String userID, int index) async {
    updateStuff(true, index);
     await Future.delayed(Duration(milliseconds: 50));
    var userDetails = await getUserDetails(userID);
    updateStuff(false, -1);
    _navigationService.navigateToUserDetailsView(
        user: userDetails, userID: userID);
  }

  @override
  void onError(error) {}

  updateStuff(bool status, int index) {
    if (status) {
      _setIndex = index;
      _isfetching = true;
    } else {
      _setIndex = -1;
      _isfetching = false;
    }
    notifyListeners();
  }
}
