import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

class HomeViewModel extends BaseViewModel {
  Future viewUsers() async {
    _navigationService.navigateToUsersView();
  }

  Future viewPosts() async {
    _navigationService.navigateToPostsView();
  }
}
