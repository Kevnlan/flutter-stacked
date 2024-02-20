import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  final _formKey = GlobalKey<FormState>();
  GlobalKey get formKey => _formKey;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  bool _processingData = false;
  bool get processingData => _processingData;

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
      case "back":
        _navigationService.back();
        break;
      default:
        break;
    }
  }

  void emailLogin() {}

  void emailRegistration() async {
    updateStatus(true);
    if (_formKey.currentState!.validate()) {
      var data = await _apiService.signup(
        email: emailController.text,
        password: passwordController.text,
        roles: [],
        firstname: firstnameController.text,
        lastname: lastnameController.text,
      );
      print("data.toString()");
      print(data.toString());
      updateStatus(false);
    }
  }

  void googleRegistration() {}

  void googleLogin() {}

  toggleBoolean(bool val) {
    if (_showPassword) {
      _showPassword = false;
    } else {
      _showPassword = true;
    }
    notifyListeners();
  }

  updateStatus(bool status) {
    _processingData = status;
    notifyListeners();
  }
}
