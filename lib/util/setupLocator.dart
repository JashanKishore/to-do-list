import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/database.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Database());
}