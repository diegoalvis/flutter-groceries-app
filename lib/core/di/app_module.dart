import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
      BaseOptions options = new BaseOptions(
        baseUrl: ApiClient.BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      return new Dio(options);
    });

    // Api
    getIt.registerSingletonAsync<ApiClient>(() async => ApiClient(await getIt.getAsync<Dio>()), dependsOn: [Dio]);
    // Repository
    getIt.registerSingletonAsync<Repository>(() async => Repository(await getIt.getAsync<ApiClient>(), await getIt.getAsync<Preferences>()),
        dependsOn: [ApiClient, Preferences]);
  }
}
