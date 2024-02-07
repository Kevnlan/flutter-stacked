import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

class HomeViewModel extends BaseViewModel {
  Future navToPage(page) async {
    switch (page) {
      case "users":
        _navigationService.navigateToUsersView();
        break;
      case "posts":
        _navigationService.navigateToPostsView();
        break;
      case "tabs":
        _navigationService.navigateToTabsView();
        break;
      case "audio":
        _navigationService.navigateToAudioView();
        break;
      case "graphql":
        _navigationService.navigateToQraphQlView();
        break;
      case "sockets":
        _navigationService.navigateToSocketsView();
        break;

      default:
        break;
    }
  }
}
