import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/admin_menu_container.dart';
import 'package:dtmtest/common/constants.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/custom_image_changer.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WebMainPage extends StatefulWidget {
  const WebMainPage({super.key});

  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  int selIndex = 0;
  bool hideMenu = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  hideMenu = !hideMenu;
                });
              },
              child: AnimatedContainer(
                width: hideMenu ? 100 : size.width * .237,
                // height: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [AppShadow.defShadow],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Assets.images.logo.image(width: 40, height: 40),
                          Visibility(
                              visible: !hideMenu, child: const Text("DTMTest")),
                          Visibility(
                            visible: !hideMenu,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hideMenu = !hideMenu;
                                  });
                                },
                                icon: Assets.icons.menu.svg()),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    ListView.separated(
                      itemCount: adminMenu.length,
                      padding: const EdgeInsets.all(11),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) => AdminMenuContainer(
                        onTap: () {
                          setState(() {
                            selIndex = index;
                          });
                        },
                        isSelected: selIndex == index,
                        index: index,
                        isHide: hideMenu,
                      ),
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 15),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 36,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        adminMenu[selIndex],
                        style: AppTextStyles.body16wb.copyWith(fontSize: 40),
                      ),
                      const Spacer(),
                      CustomImageChangerWidget(
                          image: '',
                          borderRadiusDef: BorderRadius.circular(100),
                          file: null,
                          width: 50,
                          height: 50,
                          errorImage: Assets.images.logo.path),
                      15.w,
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Baxtiyor"),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  20.h,
                  // SizedBox(
                  //     width: size.width * .39,
                  //     child: const CustomTextField(
                  //       hintText: "Search",
                  //       leading: Padding(
                  //         padding: EdgeInsets.only(left: 25, right: 10),
                  //         child: Icon(Icons.search),
                  //       ),
                  //       borderColor: Colors.transparent,
                  //       contentPadding:
                  //           EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                  //     )),
                  // 20.h,
                  Expanded(child: getPage(selIndex)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
