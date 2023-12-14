// ignore_for_file: unused_import

import 'package:flutter_application_stacked/services/api_service.dart';
import 'package:flutter_application_stacked/services/todos.service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => locator;

void setup() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerLazySingleton(() => TodosService());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}