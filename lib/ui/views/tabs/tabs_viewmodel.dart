// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/app/app.bottomsheets.dart';
import 'package:flutter_application_stacked/app/app.dialogs.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/models/images.dart';
import 'package:flutter_application_stacked/models/pixabay_images.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _apiService = locator<ApiService>();
final _bottomSheetService = locator<BottomSheetService>();
final _dialogService = locator<DialogService>();

class TabsViewModel extends BaseViewModel {
  bool get isFetching => _isfetching;
  bool _isfetching = false;

  List<PixabayImages> _approvedImages = [];
  List<PixabayImages> get approvedImages => _approvedImages;

  List<PixabayImages> _rejectedImages = [];
  List<PixabayImages> get rejectedImages => _rejectedImages;

  List<PixabayImages> _shortlistedImages = [];
  List<PixabayImages> get shortlistedImages => _shortlistedImages;

  List<PixabayImages> _curatedImages = [];
  List<PixabayImages> get curatedImages => _curatedImages;

  Future<List> fetchCuratedImages() async {
    _curatedImages.clear();
    _approvedImages.clear();
    _rejectedImages.clear();
    _shortlistedImages.clear();

    _curatedImages = await _apiService.getPixabayImages();
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

  Future approveImages(PixabayImages image) async {
    if (!_approvedImages.contains(image)) {
      _approvedImages.add(image);
      await removeRejectedImages(image);
    } else {
      _approvedImages.removeWhere((element) => element == image);
    }
    notifyListeners();
    return [_approvedImages, _rejectedImages];
  }

  Future rejectImages(PixabayImages image) async {
    // check if accepted if no do reject logic
    if (!_rejectedImages.contains(image)) {
      _rejectedImages.add(image);
      await removeApprovedImages(image);
    } else {
      _rejectedImages.removeWhere((element) => element == image);
    }

    notifyListeners();
    return _rejectedImages;
  }

  Future shortlistImages(PixabayImages image) async {
    if (!_shortlistedImages.contains(image)) {
      _shortlistedImages.add(image);
    } else {
      _shortlistedImages.removeWhere((element) => element == image);
    }
    notifyListeners();
    return _shortlistedImages;
  }

  Future removeApprovedImages(PixabayImages image) async {
    _approvedImages.removeWhere((element) => element == image);
    notifyListeners();
    return _approvedImages;
  }

    Future removeRejectedImages(PixabayImages image) async {
     _rejectedImages.removeWhere((element) => element == image);
    notifyListeners();
    return _rejectedImages;
  }

  void actionDialog(BuildContext ctx, PixabayImages image) {
    showDialog(
      context: ctx,
      builder: (context) {
        return Dialog(
          elevation: 6,
          child: Container(
            height: 12.h,
            padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                  child: Text(
                    'Choose an Action',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await approveImages(image);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Approve',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.h),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await rejectImages(image);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: const Text(
                            'Reject',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.h),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await shortlistImages(image);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Shortlist',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showAlertDialog(String message) async {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Alert!',
      description: message,
    );
  }

  void showBottomSheet(PixabayImages image) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: image.user,
      description: image.type,
      mainButtonTitle: 'Lenin',
      showIconInMainButton: true,
      secondaryButtonTitle: 'Stalin',
      showIconInSecondaryButton: true,
      additionalButtonTitle: 'Putin',
      showIconInAdditionalButton: true,
    );
  }
}
