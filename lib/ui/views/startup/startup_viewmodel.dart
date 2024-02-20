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

  void onPressed(action) {
    switch (action) {
      case "nav_login":
        _navigationService.navigateToLoginView();
        break;
      case "nav_register":
        _navigationService.navigateToSignupView();
        break;
      case "email_login":
        emailLogin();
        break;
      case "email_register":
        emailRegistration();
        break;
      case "google_signup":
        googleRegistration();
        break;
      case "google_login":
        googleLogin();
        break;
      default:
        break;
    }
  }

  void emailLogin() {}

  void emailRegistration() {}

  void googleRegistration() {}

  void googleLogin() {}
}
