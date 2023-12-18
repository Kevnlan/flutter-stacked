import 'package:flutter_application_stacked/app/app.bottomsheets.dart';
import 'package:flutter_application_stacked/app/app.dialogs.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/models/users_list.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
// import 'package:flutter_application_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();
 final _bottomSheetService = locator<BottomSheetService>();
 final _dialogService = locator<DialogService>();

class UsersViewModel extends BaseViewModel {
  bool _isfetching = false;
  int _setIndex = -1;

  bool get isFetching => _isfetching;
  int get setIndex => _setIndex;

  final _apiService = locator<ApiService>();
  List<UsersList> _usersList = [];
  List<UsersList> get usersList => _usersList;

  late User _userDeatils;

  Future<List> fetchUsers() async {
    _usersList.clear();
    _usersList = await _apiService.getListofUsers();
    return _usersList;
  }

  void getUsers() async {
    updateStuff(true);
    await fetchUsers();
    updateStuff(false);
  }

  Future<User> getUserDetails(String userID) async {
    _userDeatils = await _apiService.getUserByID(userID);
    return _userDeatils;
  }

  void getUserInfo(String userID, int index) async {
    updateStuff(true, index: index);
    var userDetails = await getUserDetails(userID);
    updateStuff(false, index: -1);
    _navigationService.navigateToUserDetailsView(
        user: userDetails, userID: userID);
  }

  updateStuff(bool status, {int? index}) {
    if (status) {
      _setIndex = index ?? 0;
      _isfetching = true;
    } else {
      _setIndex = -1;
      _isfetching = false;
    }
    notifyListeners();
  }

    void showBottomSheet(UsersList user) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: user.firstName,
      description: user.id,
      mainButtonTitle: 'Lenin',
      showIconInMainButton: true,
      secondaryButtonTitle: 'Stalin',
      showIconInSecondaryButton: true,
      additionalButtonTitle: 'Putin',
      showIconInAdditionalButton: true,
    );
  }

    void showDialog(UsersList user) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked 5 stars on Github',
    );
  }
}
