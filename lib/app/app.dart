import 'package:stacked/stacked_annotations.dart';

import '../ui/home/home_view.dart';

@StackedApp(
  routes: [
     MaterialRoute(page: HomeView),
     MaterialRoute(page: HomeView),
  ],
)
class App {}