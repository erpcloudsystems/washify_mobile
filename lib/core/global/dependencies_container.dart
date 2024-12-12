import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<BaseDioHelper>(
      () => DioHelper(dioPrefs: sl(), cookiePath: appDocPath));
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
}
