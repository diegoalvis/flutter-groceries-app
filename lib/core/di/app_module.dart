import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

/// App module that defines the generic modules to be injected in the app
class AppModule {
  static Future<void> initialise() async {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerSingletonAsync<Preferences>(() async => Preferences().init());
    getIt.registerSingletonAsync<Dio>(() async {
      Preferences pref = await getIt.getAsync<Preferences>();
      Dio dio = Dio(BaseOptions(
        baseUrl: ApiClient.BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ));
      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options) async {
        if (pref.getAuthToken() != null && pref.getAuthToken().isNotEmpty) {
          options.headers['Authorization'] = 'Bearer ${pref.getAuthToken()}';
        }
        return options;
      }, onError: (error) async {
        if (pref.getAuthToken() != null && error.response?.statusCode == 401) {
            await pref.clearSession();
        }
        return error.response;
      }));

      return dio;
    });

    // Api
    getIt.registerSingletonAsync<ApiClient>(() async => ApiClient(await getIt.getAsync<Dio>()), dependsOn: [Dio]);
    // Repository
    getIt.registerSingletonAsync<Repository>(() async => Repository(await getIt.getAsync<ApiClient>(), await getIt.getAsync<Preferences>()),
        dependsOn: [ApiClient, Preferences]);
  }
}
