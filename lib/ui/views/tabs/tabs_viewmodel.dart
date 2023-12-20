// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/models/images.dart';
import 'package:flutter_application_stacked/models/pixabay_images.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class TabsViewModel extends BaseViewModel {
  bool get isFetching => _isfetching;
  bool _isfetching = false;

  List<Images> _approvedImages = [];
  List<Images> get approvedImages => _approvedImages;

  List<Images> _rejectedImages = [];
  List<Images> get rejectedImages => _rejectedImages;

  List<Images> _shortlistedImages = [];
  List<Images> get shortlistedImages => _shortlistedImages;

  List<PixabayImages> _curatedImages = [];
  List<PixabayImages> get curatedImages => _curatedImages;

  Future<List> fetchCuratedImages() async {
    _curatedImages.clear();
    _approvedImages.clear();
    _rejectedImages.clear();
    _shortlistedImages.clear();

    _curatedImages = await _apiService.getPixabayImages();
    if (kDebugMode) {
      print('object');
    }
    if (kDebugMode) {
      print(_curatedImages.length);
    }
    return _curatedImages;
  }

  void getImages() async {
    updateStuff(true);
    await fetchCuratedImages();
    updateStuff(false);
  }

  updateStuff(bool status) {
    if (status) {
      _isfetching = true;
    } else {
      _isfetching = false;
    }
    notifyListeners();
  }

  Future addApprovedImages(Images image) async {
    if (!_approvedImages.contains(image)) {
      _approvedImages.add(image);
    } else {
      _approvedImages.removeWhere((element) => element == image);
    }

    return _approvedImages;
  }

  void approvedImageLogic(Images image) {
    addApprovedImages(image);
    notifyListeners();
  }

  void getApprovedImages() {
    notifyListeners();
  }

  Future<List> addRejectedImages() async {
    return _rejectedImages;
  }

  void getRejectedImages() {
    notifyListeners();
  }

  Future<List> addShortlistedImages() async {
    return _shortlistedImages;
  }

  void getShortlistedImages() {
    notifyListeners();
  }
}
