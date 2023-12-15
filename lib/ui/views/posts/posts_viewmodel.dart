import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/models/posts_list.dart';
import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  List<PostsList> _postsList = [];
  List<PostsList> _userPosts = [];

  List<PostsList> get postsList => _postsList;
  List<PostsList> get userPosts => _userPosts;

  bool _isfetching = false;

  bool get isFetching => _isfetching;

  Future<List> fetchPosts() async {
    _postsList.clear();
    _postsList = await _apiService.getListOfPosts();
    return _postsList;
  }

    Future<List> fetchUserPosts(String userID) async {
    _userPosts.clear();
    _userPosts = await _apiService.getUserPosts(userID);
    return _userPosts;
  }

  void getData() async {
    updateData(true);
    await fetchPosts();
    updateData(false);
  }

  updateData(bool state) {
    _isfetching = state;
    notifyListeners();
  }
}
