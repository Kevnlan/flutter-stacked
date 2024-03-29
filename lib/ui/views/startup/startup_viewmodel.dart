import 'package:stacked/stacked.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // _navigationService.replaceWithHomeView();
    // _navigationService.replaceWithPostsView();
  }

  void navToPage(page) {
    switch (page) {
      case "login":
        _navigationService.navigateToLoginView();
        break;
      case "register":
        _navigationService.navigateToSignupView();
        break;
      case "google":
        break;
      default:
        break;
    }
  }

  void googleRegistration(){}
}
