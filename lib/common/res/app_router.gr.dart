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
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
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
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    QuizsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizsPage(),
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
    ThemesRoute.name: (routeData) {
      final args = routeData.argsAs<ThemesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ThemesPage(
          key: args.key,
          scienceName: args.scienceName,
          index: args.index,
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebMainPage(),
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
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

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
/// [QuizsPage]
class QuizsRoute extends PageRouteInfo<void> {
  const QuizsRoute({List<PageRouteInfo>? children})
      : super(
          QuizsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizsRoute';

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
/// [ThemesPage]
class ThemesRoute extends PageRouteInfo<ThemesRouteArgs> {
  ThemesRoute({
    Key? key,
    required String scienceName,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          ThemesRoute.name,
          args: ThemesRouteArgs(
            key: key,
            scienceName: scienceName,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'ThemesRoute';

  static const PageInfo<ThemesRouteArgs> page = PageInfo<ThemesRouteArgs>(name);
}

class ThemesRouteArgs {
  const ThemesRouteArgs({
    this.key,
    required this.scienceName,
    required this.index,
  });

  final Key? key;

  final String scienceName;

  final int index;

  @override
  String toString() {
    return 'ThemesRouteArgs{key: $key, scienceName: $scienceName, index: $index}';
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
class WebMainRoute extends PageRouteInfo<void> {
  const WebMainRoute({List<PageRouteInfo>? children})
      : super(
          WebMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
