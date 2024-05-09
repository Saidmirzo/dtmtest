import 'package:dtmtest/core/platform/network_info.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/datasource/advertising_datasource.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/repository/advertising_repository_impl.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/domain/advertising_repository.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/bloc/bloc/web_advertising_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/data/data_sources/tarifs_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/data/repositories/tarifs_repository_impl.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/repositories/tarifs_repository.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/bloc/tarifs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/web_categories_bloc.dart';
import 'package:dtmtest/features/admin_panel/all_data_sources/web_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/repositories/web_users_repository_impl.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_remote_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/data/repository/auth_repository_impl.dart';
import 'package:dtmtest/features/mobile/auth/domain/repository/auth_repository.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/category/data/repositories/category_repository_impl.dart';
import 'package:dtmtest/features/mobile/category/domain/repositories/category_repository.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:dtmtest/features/mobile/profile/data/datasource/profile_remote_datasource.dart';
import 'package:dtmtest/features/mobile/profile/data/repository/profile_repository_impl.dart';
import 'package:dtmtest/features/mobile/profile/domain/repository/profile_repository.dart';
import 'package:dtmtest/features/mobile/profile/presentation/bloc/profile_bloc.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/bloc/plans_bloc.dart';
import 'package:dtmtest/features/mobile/tests/data/datasource/tests_remote_datasource.dart';
import 'package:dtmtest/features/mobile/tests/data/repository/tests_repository_impl.dart';
import 'package:dtmtest/features/mobile/tests/domain/repository/tests_repository.dart';
import 'package:dtmtest/features/mobile/tests/presentation/bloc/bloc/tests_bloc.dart';
import 'package:dtmtest/features/mobile/themes/data/datasource/themes_remote_datasource.dart';
import 'package:dtmtest/features/mobile/themes/data/repository/themes_repository_impl.dart';
import 'package:dtmtest/features/mobile/themes/domain/repository/themes_repository.dart';
import 'package:dtmtest/features/mobile/themes/presentation/bloc/themes_bloc.dart';
import 'package:dtmtest/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final di = GetIt.instance;

Future<void> init() async {
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.registerFactory(() => AuthBloc(authRepository: di()));
  di.registerFactory(() => WebBloc(webRepository: di()));
  di.registerFactory(() => WebAdminsBloc(webRepository: di()));
  di.registerFactory(() => CategoryBloc(categoryRepository: di()));
  di.registerFactory(() => WebCategoriesBloc(webRepository: di()));
  di.registerFactory(() => ThemesBloc(themesRepository: di()));
  di.registerFactory(() => PlansBloc(webRepository: di()));
  di.registerFactory(() => HistoryBloc(webRepository: di()));
  di.registerFactory(() => TestsBloc(testsRepository: di()));
  di.registerFactory(
    () => HomeBloc(
      repository: di(),
      advertisingRepository: di(),
    ),
  );
  di.registerFactory(
    () => ProfileBloc(
      authRepository: di(),
      webRepository: di(),
      advertisingRepository: di(),
    ),
  );
  di.registerFactory(
    () => WebAdvertisingBloc(
      advertisingRepository: di(),
    ),
  );
  di.registerFactory(() => TarifsBloc(tarifRepository: di()));

  //UseCases
  // di.registerLazySingleton(() => LoginUseCase(repository: di()));

  //Repository
  di.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: di(),
      authLocaleDataSource: di(),
    ),
  );
  di.registerFactory<WebRepository>(
    () => WebRepositoryImpl(
      webRemoteDataSource: di(),
    ),
  );

  di.registerFactory<CategoryRepository>(
    () => CategoryRepositoryImpl(
      webRemoteDataSource: di(),
    ),
  );
  di.registerFactory<ThemesRepository>(
    () => ThemesRepositoryImpl(
      webRemoteDataSource: di(),
      themesDataSource: di(),
    ),
  );
  di.registerFactory<TestsRepository>(
    () => TestsRepositoryImpl(testsRemoteDataSource: di()),
  );
  di.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
        profileRemoteDataSource: di(), authLocaleDataSource: di()),
  );
  di.registerFactory<AdvertisingRepository>(
    () => AdvertisingRepositoryImpl(advertisingRemoteDataSource: di()),
  );
  di.registerFactory<TarifsRepository>(
    () => TarifsRepositoryImpl(tarifRemoteDataSource: di()),
  );
  // DataSource
  di.registerLazySingleton<AuthLocaleDataSource>(
    () => AuthLocaleDataSourceImpl(),
  );
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(authLocaleDataSource: di()),
  );
  di.registerLazySingleton<WebRemoteDataSource>(
    () => WebRemoteDataSourceImpl(authLocaleDataSource: di()),
  );
  di.registerLazySingleton<TestsRemoteDataSource>(
    () => TestsRemoteDataSourceImpl(authLocaleDataSource: di()),
  );
  di.registerLazySingleton<ThemesDataSource>(
    () => ThemesDataSourceImpl(),
  );
  di.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(authLocaleDataSource: di()),
  );
  di.registerLazySingleton<AdvertisingRemoteDataSource>(
    () => AdvertisingRemoteDataSourceImpl(),
  );
  di.registerLazySingleton<TarifsRemoteDataSource>(
    () => TarifsRemoteDataSourceImpl(),
  );

  /// Network
  // final options = BaseOptions(
  //     baseUrl: 'https://api.timtim.uz/api2',
  //     connectTimeout: const Duration(seconds: 50),
  //     receiveTimeout: const Duration(seconds: 30),
  //     headers: {
  //       // 'Content-Type': 'application/x-www-form-urlencoded',
  //       'accept': 'application/json'
  //     });

  // Dio dio = Dio(options);

  // dio.interceptors.add(alice.getDioInterceptor());

  // di.registerSingleton<Dio>(dio);
  // dio.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90));

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local cache

  //
  // /// Local datasource
  // await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(1)) {
  //   Hive.registerAdapter<LoginModel>(LoginModelAdapter());
  //   await Hive.openBox(HiveKey.userModel);
  // }
}
