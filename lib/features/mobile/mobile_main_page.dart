import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:auto_route/auto_route.dart';
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
          ChatRoute(),
          CategoryRoute(),
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
            selectedItemColor: ColorName.blue[500],
            unselectedItemColor: ColorName.black,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                label: tr(LocaleKeys.home),
                icon: Assets.icons.icon.svg(
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 0
                      ? ColorName.blue[500]
                      : ColorName.black,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.inbox),
                icon: Assets.icons.inbox.svg(  
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 1
                      ? ColorName.blue[500]
                      : ColorName.black,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.menu),
                icon: Assets.icons.menu.svg(
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 2
                      ? ColorName.blue[500]
                      : ColorName.black,
                ),
              ),
              BottomNavigationBarItem(
                label: tr(LocaleKeys.account),
                icon: Assets.icons.profile.svg(
                  // ignore: deprecated_member_use_from_same_package
                  color: tabsRouter.activeIndex == 3
                      ? ColorName.blue[500]
                      : ColorName.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
