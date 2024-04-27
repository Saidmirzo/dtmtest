import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/assets.gen.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:dtmtest/common/res/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndexForAppBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          CategoryRoute(),
          HistoryRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          activeIndexForAppBar = tabsRouter.activeIndex;
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              setState(() {
                activeIndexForAppBar = value;
              });
              tabsRouter.setActiveIndex(value);
            },
            selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: ColorName.white),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            selectedItemColor: ColorName.customColor,
            unselectedItemColor: ColorName.black,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                label: tr(LocaleKeys.home),
                icon: Assets.icons.home.svg(
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 0
                      ? ColorName.customColor
                      : null,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.inbox),
                icon: Assets.icons.category.svg(
                  color: tabsRouter.activeIndex == 1
                      ? ColorName.customColor
                      : null,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.menu),
                icon: Assets.icons.history.svg(
                  color: tabsRouter.activeIndex == 2
                      ? ColorName.customColor
                      : null,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.account),
                icon: Assets.icons.profile.svg(
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 3
                      ? ColorName.customColor
                      : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
