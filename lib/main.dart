import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/admin_panel/web_admins/bloc/web_admins_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_categories/bloc/web_categories_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/bloc/tarifs_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:dtmtest/features/mobile/history/bloc/history_bloc.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:dtmtest/features/mobile/profile/presentation/bloc/profile_bloc.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/bloc/plans_bloc.dart';
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
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di<AuthBloc>()),
          BlocProvider(create: (context) => di<WebBloc>()),
          BlocProvider(create: (context) => di<CategoryBloc>()),
          BlocProvider(create: (context) => di<WebAdminsBloc>()),
          BlocProvider(create: (context) => di<WebCategoriesBloc>()),
          BlocProvider(create: (context) => di<ThemesBloc>()),
          BlocProvider(create: (context) => di<PlansBloc>()),
          BlocProvider(create: (context) => di<HistoryBloc>()),
          BlocProvider(create: (context) => di<TestsBloc>()),
          BlocProvider(create: (context) => di<HomeBloc>()),
          BlocProvider(create: (context) => di<ProfileBloc>()),
          BlocProvider(create: (context) => di<TarifsBloc>()),
        ],
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: "DTM Test AdminDashboard",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: false),
        ),
      ),
    );
  }
}
