import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:flutter_application_stacked/services/todos.service.dart';
import 'package:flutter_application_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_application_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_application_stacked/ui/views/home/home_view.dart';
import 'package:flutter_application_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_application_stacked/ui/views/user_details/user_details_view.dart';
import 'package:flutter_application_stacked/ui/views/posts/posts_view.dart';
import 'package:flutter_application_stacked/ui/views/post_details/post_details_view.dart';
import 'package:flutter_application_stacked/ui/views/users/users_view.dart';
import 'package:flutter_application_stacked/ui/views/tabs/tabs_view.dart';
import 'package:flutter_application_stacked/ui/views/audio/audio_view.dart';
import 'package:flutter_application_stacked/ui/views/qraph_ql/qraph_ql_view.dart';
import 'package:flutter_application_stacked/ui/views/sockets/sockets_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UserDetailsView),
    MaterialRoute(page: PostsView),
    MaterialRoute(page: PostDetailsView),
    MaterialRoute(page: UsersView),
    MaterialRoute(page: TabsView),
    MaterialRoute(page: AudioView),
    MaterialRoute(page: QraphQlView),
    MaterialRoute(page: SocketsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: TodosService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
