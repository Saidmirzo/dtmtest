import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/constants.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/res/colors.gen.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
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
              selectedItemColor: ColorName.orange,
              unselectedItemColor: ColorName.customColor,
              showUnselectedLabels: true,
              items: List.generate(
                labels.length,
                (index) => BottomNavigationBarItem(
                  label: labels[index],
                  icon: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: tabsRouter.activeIndex == index
                            ? ColorName.orange
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: listIcons[index].svg(
                      // ignore: deprecated_member_use_from_same_package
                      color: tabsRouter.activeIndex == index
                          ? ColorName.white
                          : ColorName.customColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
