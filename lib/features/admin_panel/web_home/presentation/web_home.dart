import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/widgets/admin_home_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 125,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [AppShadow.defShadow],
                borderRadius: BorderRadius.circular(30),
                color: Colors.white),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdminHomeWidget(
                  title: '254',
                  subtitle: 'Users',
                ),
                VerticalDivider(),
                AdminHomeWidget(
                  title: '872',
                  subtitle: 'Categories',
                ),
                VerticalDivider(),
                AdminHomeWidget(
                  title: '104',
                  subtitle: 'Themes',
                ),
                VerticalDivider(),
                AdminHomeWidget(
                  title: '4551',
                  subtitle: 'Quizes',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
