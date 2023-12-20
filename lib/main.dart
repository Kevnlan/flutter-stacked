import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/app/app.bottomsheets.dart';
import 'package:flutter_application_stacked/app/app.dialogs.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".assets/.env");
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      // theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
