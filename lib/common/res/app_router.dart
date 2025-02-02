import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/pages/web_advertising.dart';
import 'package:dtmtest/features/admin_panel/web_auth/presentation/pages/web_auth_page.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/pages/web_categories.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/pages/web_quizes.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/web_home.dart';
import 'package:dtmtest/features/admin_panel/web_main_page.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/tarifs.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/pages/web_admins.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/pages/web_users.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/connectivity_screen.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/mobile_login_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/sifn_in_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/sign_up_page.dart';
import 'package:dtmtest/features/mobile/auth/presentation/pages/splash_page.dart';
import 'package:dtmtest/features/mobile/category/presentation/pages/category_page.dart';
import 'package:dtmtest/features/mobile/history/history.dart';
import 'package:dtmtest/features/mobile/history/history_detail.dart';
import 'package:dtmtest/features/mobile/home/pages/home_page.dart';
import 'package:dtmtest/features/mobile/home/pages/leaders_board.dart';
import 'package:dtmtest/features/mobile/mobile_main_page.dart';
import 'package:dtmtest/features/mobile/profile/presentation/pages/about_us.dart';
import 'package:dtmtest/features/mobile/profile/presentation/pages/plans_page.dart';
import 'package:dtmtest/features/mobile/profile/presentation/pages/privacy_police.dart';
import 'package:dtmtest/features/mobile/profile/presentation/pages/profile_page.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
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
  static const String historyDetailPage = '/historyDetailPage';
  static const String leadersBoard = '/leadersBoard';
  static const String aboutUs = '/aboutUs';
  static const String privacyPolicy = '/privacyPolicy';
  static const String webAuthRoute = '/webAuthRoute';
  static const String noConnectionPage = '/noConnectionPage';

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
      path: webAuthRoute,
      page: WebAuthRoute.page,
    ),
    AutoRoute(
      path: themesPage,
      page: ThemesRoute.page,
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
    AutoRoute(
      page: HistoryDatailRoute.page,
      path: signUpRoute,
    ),
    AutoRoute(
      page: LeaderBoardRoute.page,
      path: leadersBoard,
    ),
    AutoRoute(
      page: AboutUsRoute.page,
      path: aboutUs,
    ),
    AutoRoute(
      page: PrivacyPolicyRoute.page,
      path: privacyPolicy,
    ),
    AutoRoute(
      page: ConnectivityRoute.page,
      path: noConnectionPage,
    ),
  ];
}
