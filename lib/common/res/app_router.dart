import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/tarifs.dart';
import 'package:dtmtest/features/admin_panel/web_admins/presentation/web_admins.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/web_advertising.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/web_categories.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/web_home.dart';
import 'package:dtmtest/features/admin_panel/web_main_page.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/presentation/web_quizes.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/pages/web_users.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/mobile_login_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/sifn_in_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/sign_up_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/splash_page.dart';
import 'package:dtmtest/features/mobile/category/presentation/pages/category_page.dart';
import 'package:dtmtest/features/mobile/history/history.dart';
import 'package:dtmtest/features/mobile/home/presentation/pages/home_page.dart';
import 'package:dtmtest/features/mobile/mobile_main_page.dart';
import 'package:dtmtest/features/mobile/profile/presentation/pages/profile_page.dart';
import 'package:dtmtest/features/mobile/quizs/presentation/pages/quizs_page.dart';
import 'package:dtmtest/features/mobile/tarifs/presentation/page/plans_page.dart';
import 'package:dtmtest/features/mobile/tests/presentation/page/tests_page.dart';
import 'package:dtmtest/features/mobile/tests/presentation/page/tests_result_page.dart';
import 'package:dtmtest/features/mobile/themes/presentation/page/themes_page.dart';
import 'package:flutter/foundation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  static const String webMainRoute = '/WebMainRoute';
  static const String mainRoute = '/WebMainRoute';
  static const String mobileLoginRoute = '/MobileLoginRoute';
  static const String signInRoute = '/signInRoute';
  static const String signUpRoute = '/signUpRoute';
  static const String splashRoute = '/';
  static const String themesPage = '/themesPage';
  static const String plansPage = '/plansPage';
  static const String quizsPage = '/quizsPage';
  static const String testsPage = '/testsPage';
  static const String testsResultPage = '/testsResultPage';

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: WebMainRoute.page,
      path: webMainRoute,
      children: [
        AutoRoute(
          page: WebHomeRoute.page,
        ),
        AutoRoute(
          page: WebUsersRoute.page,
        ),
        AutoRoute(
          page: WebAdminsRoute.page,
        ),
        AutoRoute(
          page: WebCategoriesRoute.page,
        ),
        AutoRoute(
          page: WebQuizesRoute.page,
        ),
        AutoRoute(
          page: WebAdminsRoute.page,
        ),
      ],
    ),
    AutoRoute(
      page: MainRoute.page,
      path: mainRoute,
      children: [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: CategoryRoute.page,
        ),
        AutoRoute(
          page: HistoryRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
      ],
    ),

    AutoRoute(
      path: plansPage,
      page: PlansRoute.page,
    ),
    AutoRoute(
      path: themesPage,
      page: ThemesRoute.page,
    ),
    AutoRoute(
      path: quizsPage,
      page: QuizsRoute.page,
    ),
    AutoRoute(
      path: testsPage,
      page: TestsRoute.page,
    ),
    // // Normal Users1

    AutoRoute(
      page: MobileLoginRoute.page,
      path: mobileLoginRoute,
    ),
    AutoRoute(
      page: SplashRoute.page,
      path: splashRoute,
    ),
     AutoRoute(
      page: SignInRoute.page,
      path: signInRoute,
    ),
     AutoRoute(
      page: SignUpRoute.page,
      path: signUpRoute,
    ),
     AutoRoute(
      page: TestsResultRoute.page,
      path: testsResultPage,
    ),
  ];
}
