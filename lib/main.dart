import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/app/app.bottomsheets.dart';
import 'package:flutter_application_stacked/app/app.dialogs.dart';
import 'package:flutter_application_stacked/app/app.locator.dart';
import 'package:flutter_application_stacked/app/app.router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await dotenv.load(fileName: "assets/.env");

  final HttpLink link = HttpLink(
    'https://spacex-production.up.railway.app/',
  );

  // final HttpLink rickAndMortyHttpLink =
  //   HttpLink('https://rickandmortyapi.com/graphql');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
    ),
  );
  runApp(MainApp(
    client: client,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.client});
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GraphQLProvider(
          client: client,
          child: MaterialApp(
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            // theme: ThemeData.dark(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          ),
        );
      },
    );
  }
}
