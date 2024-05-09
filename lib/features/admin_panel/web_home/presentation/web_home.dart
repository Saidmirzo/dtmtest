import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_home/data/model/home_detail_model.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/bloc/web_home_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/widgets/admin_home_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebHomeBloc>().add(GetHomeDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocConsumer<WebHomeBloc, WebHomeState>(
        listener: (context, state) {
          if (state.getHomeDetailStatus == BlocStatus.failed) {
            showSnackBar(context, text: "Error");
          }
        },
        builder: (context, state) {
          if (state.getHomeDetailStatus.isProgress) {
            return UI.spinner();
          }
          final HomeDetailModel homeDetailModel =
              state.homeDetailModel ?? HomeDetailModel();
          return Column(
            children: [
              Container(
                height: 125,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [AppShadow.defShadow],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdminHomeWidget(
                      title: homeDetailModel.users.toString(),
                      subtitle: 'Users',
                    ),
                    const VerticalDivider(),
                    AdminHomeWidget(
                      title: homeDetailModel.categoyies.toString(),
                      subtitle: 'Categories',
                    ),
                    const VerticalDivider(),
                    AdminHomeWidget(
                      title: homeDetailModel.themes.toString(),
                      subtitle: 'Themes',
                    ),
                    const VerticalDivider(),
                    AdminHomeWidget(
                      title: homeDetailModel.quizes.toString(),
                      subtitle: 'Quizes',
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
