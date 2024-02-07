// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i13;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/models/user.dart' as _i14;
import 'package:flutter_application_stacked/ui/views/audio/audio_view.dart'
    as _i9;
import 'package:flutter_application_stacked/ui/views/home/home_view.dart'
    as _i2;
import 'package:flutter_application_stacked/ui/views/post_details/post_details_view.dart'
    as _i6;
import 'package:flutter_application_stacked/ui/views/posts/posts_view.dart'
    as _i5;
import 'package:flutter_application_stacked/ui/views/qraph_ql/qraph_ql_view.dart'
    as _i10;
import 'package:flutter_application_stacked/ui/views/sockets/sockets_view.dart'
    as _i11;
import 'package:flutter_application_stacked/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:flutter_application_stacked/ui/views/tabs/tabs_view.dart'
    as _i8;
import 'package:flutter_application_stacked/ui/views/user_details/user_details_view.dart'
    as _i4;
import 'package:flutter_application_stacked/ui/views/users/users_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const userDetailsView = '/user-details-view';

  static const postsView = '/posts-view';

  static const postDetailsView = '/post-details-view';

  static const usersView = '/users-view';

  static const tabsView = '/tabs-view';

  static const audioView = '/audio-view';

  static const qraphQlView = '/qraph-ql-view';

  static const socketsView = '/sockets-view';

  static const all = <String>{
    homeView,
    startupView,
    userDetailsView,
    postsView,
    postDetailsView,
    usersView,
    tabsView,
    audioView,
    qraphQlView,
    socketsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.userDetailsView,
      page: _i4.UserDetailsView,
    ),
    _i1.RouteDef(
      Routes.postsView,
      page: _i5.PostsView,
    ),
    _i1.RouteDef(
      Routes.postDetailsView,
      page: _i6.PostDetailsView,
    ),
    _i1.RouteDef(
      Routes.usersView,
      page: _i7.UsersView,
    ),
    _i1.RouteDef(
      Routes.tabsView,
      page: _i8.TabsView,
    ),
    _i1.RouteDef(
      Routes.audioView,
      page: _i9.AudioView,
    ),
    _i1.RouteDef(
      Routes.qraphQlView,
      page: _i10.QraphQlView,
    ),
    _i1.RouteDef(
      Routes.socketsView,
      page: _i11.SocketsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.UserDetailsView: (data) {
      final args = data.getArgs<UserDetailsViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.UserDetailsView(
            key: args.key, user: args.user, userID: args.userID),
        settings: data,
      );
    },
    _i5.PostsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PostsView(),
        settings: data,
      );
    },
    _i6.PostDetailsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PostDetailsView(),
        settings: data,
      );
    },
    _i7.UsersView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.UsersView(),
        settings: data,
      );
    },
    _i8.TabsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TabsView(),
        settings: data,
      );
    },
    _i9.AudioView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.AudioView(),
        settings: data,
      );
    },
    _i10.QraphQlView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.QraphQlView(),
        settings: data,
      );
    },
    _i11.SocketsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SocketsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class UserDetailsViewArguments {
  const UserDetailsViewArguments({
    this.key,
    required this.user,
    required this.userID,
  });

  final _i13.Key? key;

  final _i14.User user;

  final String userID;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user", "userID": "$userID"}';
  }

  @override
  bool operator ==(covariant UserDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user && other.userID == userID;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode ^ userID.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserDetailsView({
    _i13.Key? key,
    required _i14.User user,
    required String userID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userDetailsView,
        arguments:
            UserDetailsViewArguments(key: key, user: user, userID: userID),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPostsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.postsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPostDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.postDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.usersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTabsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tabsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAudioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.audioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQraphQlView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.qraphQlView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSocketsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.socketsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserDetailsView({
    _i13.Key? key,
    required _i14.User user,
    required String userID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userDetailsView,
        arguments:
            UserDetailsViewArguments(key: key, user: user, userID: userID),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPostsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.postsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPostDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.postDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.usersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTabsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tabsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAudioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.audioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQraphQlView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.qraphQlView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSocketsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.socketsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
