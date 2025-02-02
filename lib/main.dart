import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/bloc/bloc/web_advertising_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_auth/presentation/bloc/bloc/web_auth_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/category_bloc/web_categories_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/bloc/quizs_bloc/web_quizs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/bloc/web_home_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/bloc/tarifs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/users_bloc/web_users_bloc.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/connectivity/connectivity_cubit.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/connectivity_screen.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/bloc/plans_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/bloc/profile_bloc.dart';
import 'package:dtmtest/features/mobile/tests/presentation/bloc/bloc/tests_bloc.dart';
import 'package:dtmtest/features/mobile/themes/presentation/bloc/themes_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/di.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: const [
          Locale('en'),
          Locale('uz'),
          Locale('ru'),
        ],
        path: 'assets/l10n',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  final _connectionCubit = ConnectivityCubit();

  @override
  void initState() {
    _connectionCubit.checkConnectivity();
    _connectionCubit.trackConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      bloc: _connectionCubit,
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di<AuthBloc>()),
              BlocProvider(create: (context) => di<WebBloc>()),
              BlocProvider(create: (context) => di<CategoryBloc>()),
              BlocProvider(create: (context) => di<WebUsersBloc>()),
              BlocProvider(create: (context) => di<WebCategoriesBloc>()),
              BlocProvider(create: (context) => di<ThemesBloc>()),
              BlocProvider(create: (context) => di<PlansBloc>()),
              BlocProvider(create: (context) => di<HistoryBloc>()),
              BlocProvider(create: (context) => di<TestsBloc>()),
              BlocProvider(create: (context) => di<HomeBloc>()),
              BlocProvider(create: (context) => di<ProfileBloc>()),
              BlocProvider(create: (context) => di<WebAdvertisingBloc>()),
              BlocProvider(create: (context) => di<TarifsBloc>()),
              BlocProvider(create: (context) => di<WebAuthBloc>()),
              BlocProvider(create: (context) => di<WebQuizsBloc>()),
              BlocProvider(create: (context) => di<WebHomeBloc>()),
              BlocProvider(create: (context) => _connectionCubit),
            ],
            child: MaterialApp.router(
              routerConfig: _appRouter.config(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: "DTM Test",
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(useMaterial3: false),
              builder: (context, child) {
                if (state.isConnected) {
                  return child!;
                } else {
                  return const ConnectivityScreen();
                  // return  context.pushRoute(const ConnectivityRoute());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
