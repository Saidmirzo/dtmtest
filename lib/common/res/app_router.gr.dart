// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutUsPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryPage(),
      );
    },
    ConnectivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectivityScreen(),
      );
    },
    HistoryDatailRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDatailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HistoryDatailPage(
          key: args.key,
          historyModel: args.historyModel,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LeaderBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LeaderBoardPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MobileLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MobileLoginPage(),
      );
    },
    PlansRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlansPage(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TestsRoute.name: (routeData) {
      final args = routeData.argsAs<TestsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TestsPage(
          key: args.key,
          themeModel: args.themeModel,
        ),
      );
    },
    TestsResultRoute.name: (routeData) {
      final args = routeData.argsAs<TestsResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TestsResultPage(
          key: args.key,
          historyModel: args.historyModel,
        ),
      );
    },
    ThemesRoute.name: (routeData) {
      final args = routeData.argsAs<ThemesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ThemesPage(
          key: args.key,
          categoryModel: args.categoryModel,
        ),
      );
    },
    WebAdminsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebAdminsPage(),
      );
    },
    WebAdvrtisingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebAdvrtisingPage(),
      );
    },
    WebAuthRoute.name: (routeData) {
      final args = routeData.argsAs<WebAuthRouteArgs>(
          orElse: () => const WebAuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebAuthPage(key: args.key),
      );
    },
    WebCategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebCategoriesPage(),
      );
    },
    WebHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebHomePage(),
      );
    },
    WebMainRoute.name: (routeData) {
      final args = routeData.argsAs<WebMainRouteArgs>(
          orElse: () => const WebMainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebMainPage(
          key: args.key,
          adminModel: args.adminModel,
        ),
      );
    },
    WebQuizesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebQuizesPage(),
      );
    },
    WebTarifsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebTarifsPage(),
      );
    },
    WebUsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebUsersPage(),
      );
    },
  };
}

/// generated route for
/// [AboutUsPage]
class AboutUsRoute extends PageRouteInfo<void> {
  const AboutUsRoute({List<PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConnectivityScreen]
class ConnectivityRoute extends PageRouteInfo<void> {
  const ConnectivityRoute({List<PageRouteInfo>? children})
      : super(
          ConnectivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryDatailPage]
class HistoryDatailRoute extends PageRouteInfo<HistoryDatailRouteArgs> {
  HistoryDatailRoute({
    Key? key,
    required HistoryModel? historyModel,
    List<PageRouteInfo>? children,
  }) : super(
          HistoryDatailRoute.name,
          args: HistoryDatailRouteArgs(
            key: key,
            historyModel: historyModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryDatailRoute';

  static const PageInfo<HistoryDatailRouteArgs> page =
      PageInfo<HistoryDatailRouteArgs>(name);
}

class HistoryDatailRouteArgs {
  const HistoryDatailRouteArgs({
    this.key,
    required this.historyModel,
  });

  final Key? key;

  final HistoryModel? historyModel;

  @override
  String toString() {
    return 'HistoryDatailRouteArgs{key: $key, historyModel: $historyModel}';
  }
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LeaderBoardPage]
class LeaderBoardRoute extends PageRouteInfo<void> {
  const LeaderBoardRoute({List<PageRouteInfo>? children})
      : super(
          LeaderBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeaderBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MobileLoginPage]
class MobileLoginRoute extends PageRouteInfo<void> {
  const MobileLoginRoute({List<PageRouteInfo>? children})
      : super(
          MobileLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'MobileLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlansPage]
class PlansRoute extends PageRouteInfo<void> {
  const PlansRoute({List<PageRouteInfo>? children})
      : super(
          PlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TestsPage]
class TestsRoute extends PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    Key? key,
    required ThemeModel themeModel,
    List<PageRouteInfo>? children,
  }) : super(
          TestsRoute.name,
          args: TestsRouteArgs(
            key: key,
            themeModel: themeModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TestsRoute';

  static const PageInfo<TestsRouteArgs> page = PageInfo<TestsRouteArgs>(name);
}

class TestsRouteArgs {
  const TestsRouteArgs({
    this.key,
    required this.themeModel,
  });

  final Key? key;

  final ThemeModel themeModel;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key, themeModel: $themeModel}';
  }
}

/// generated route for
/// [TestsResultPage]
class TestsResultRoute extends PageRouteInfo<TestsResultRouteArgs> {
  TestsResultRoute({
    Key? key,
    required HistoryModel historyModel,
    List<PageRouteInfo>? children,
  }) : super(
          TestsResultRoute.name,
          args: TestsResultRouteArgs(
            key: key,
            historyModel: historyModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TestsResultRoute';

  static const PageInfo<TestsResultRouteArgs> page =
      PageInfo<TestsResultRouteArgs>(name);
}

class TestsResultRouteArgs {
  const TestsResultRouteArgs({
    this.key,
    required this.historyModel,
  });

  final Key? key;

  final HistoryModel historyModel;

  @override
  String toString() {
    return 'TestsResultRouteArgs{key: $key, historyModel: $historyModel}';
  }
}

/// generated route for
/// [ThemesPage]
class ThemesRoute extends PageRouteInfo<ThemesRouteArgs> {
  ThemesRoute({
    Key? key,
    required CategoryModel? categoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          ThemesRoute.name,
          args: ThemesRouteArgs(
            key: key,
            categoryModel: categoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ThemesRoute';

  static const PageInfo<ThemesRouteArgs> page = PageInfo<ThemesRouteArgs>(name);
}

class ThemesRouteArgs {
  const ThemesRouteArgs({
    this.key,
    required this.categoryModel,
  });

  final Key? key;

  final CategoryModel? categoryModel;

  @override
  String toString() {
    return 'ThemesRouteArgs{key: $key, categoryModel: $categoryModel}';
  }
}

/// generated route for
/// [WebAdminsPage]
class WebAdminsRoute extends PageRouteInfo<void> {
  const WebAdminsRoute({List<PageRouteInfo>? children})
      : super(
          WebAdminsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebAdminsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebAdvrtisingPage]
class WebAdvrtisingRoute extends PageRouteInfo<void> {
  const WebAdvrtisingRoute({List<PageRouteInfo>? children})
      : super(
          WebAdvrtisingRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebAdvrtisingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebAuthPage]
class WebAuthRoute extends PageRouteInfo<WebAuthRouteArgs> {
  WebAuthRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WebAuthRoute.name,
          args: WebAuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebAuthRoute';

  static const PageInfo<WebAuthRouteArgs> page =
      PageInfo<WebAuthRouteArgs>(name);
}

class WebAuthRouteArgs {
  const WebAuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'WebAuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [WebCategoriesPage]
class WebCategoriesRoute extends PageRouteInfo<void> {
  const WebCategoriesRoute({List<PageRouteInfo>? children})
      : super(
          WebCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebCategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebHomePage]
class WebHomeRoute extends PageRouteInfo<void> {
  const WebHomeRoute({List<PageRouteInfo>? children})
      : super(
          WebHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebMainPage]
class WebMainRoute extends PageRouteInfo<WebMainRouteArgs> {
  WebMainRoute({
    Key? key,
    AdminModel? adminModel,
    List<PageRouteInfo>? children,
  }) : super(
          WebMainRoute.name,
          args: WebMainRouteArgs(
            key: key,
            adminModel: adminModel,
          ),
          initialChildren: children,
        );

  static const String name = 'WebMainRoute';

  static const PageInfo<WebMainRouteArgs> page =
      PageInfo<WebMainRouteArgs>(name);
}

class WebMainRouteArgs {
  const WebMainRouteArgs({
    this.key,
    this.adminModel,
  });

  final Key? key;

  final AdminModel? adminModel;

  @override
  String toString() {
    return 'WebMainRouteArgs{key: $key, adminModel: $adminModel}';
  }
}

/// generated route for
/// [WebQuizesPage]
class WebQuizesRoute extends PageRouteInfo<void> {
  const WebQuizesRoute({List<PageRouteInfo>? children})
      : super(
          WebQuizesRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebQuizesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebTarifsPage]
class WebTarifsRoute extends PageRouteInfo<void> {
  const WebTarifsRoute({List<PageRouteInfo>? children})
      : super(
          WebTarifsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebTarifsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebUsersPage]
class WebUsersRoute extends PageRouteInfo<void> {
  const WebUsersRoute({List<PageRouteInfo>? children})
      : super(
          WebUsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebUsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
