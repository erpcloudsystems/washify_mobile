import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper(dioPrefs: sl()));
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
}
