import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ebook_name/core/common/enum.dart';
import 'package:ebook_name/core/config/app_config.dart';
import 'package:ebook_name/core/helper/network/network_checker.dart';
import 'package:ebook_name/data/data_source/local/token_provider.dart';
import 'package:ebook_name/data/data_source/remote/api_client.dart';
import 'package:ebook_name/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ebook_name/data/repositories/auth_repo_impl.dart';
import 'package:ebook_name/domain/repositories/auth_repo.dart';
import 'package:ebook_name/domain/use_case/auth_use_case.dart';

class Injector {
  static final getxFind = Get.find;

  static Future<void> setupEnvironment(Environment env) async {
    AppConfig appConfig = AppConfig(env);
    await appConfig.setup();
    Get.lazyPut<AppConfig>(() => appConfig, fenix: true);
  }

  static Future<void> setupData() async {
    NetworkChecker networkChecker = NetworkChecker();
    await networkChecker.init();
    Get.lazyPut<NetworkChecker>(() => networkChecker, fenix: true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // di for local datasource
    Get.lazyPut<TokenProvider>(() => TokenProvider(sharedPreferences),
        fenix: true);
    // di for remote data source
    Get
      ..lazyPut<ApiHandler>(
          () => ApiClient(
              baseUrl: Get.find<AppConfig>().baseUrl,
              tokenProvider: getxFind()),
          fenix: true)
      ..lazyPut<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(getxFind()),
          fenix: true);
  }

  static Future<void> setupDomain() async {
    // di for repositories
    Get.lazyPut<AuthRepo>(
        () => AuthRepoImpl(
              getxFind(),
              getxFind(),
            ),
        fenix: true);
    // di for use case
    Get.lazyPut<AuthUseCase>(() => AuthUseCase(getxFind()), fenix: true);
  }
}
