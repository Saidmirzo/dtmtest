import 'package:dtmtest/common/components/admin_row_widget.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/blocs/bloc/web_bloc.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/widgets/admin_users_row_widget.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebUsersPage extends StatefulWidget {
  const WebUsersPage({super.key});

  @override
  State<WebUsersPage> createState() => _WebUsersPageState();
}

class _WebUsersPageState extends State<WebUsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<WebBloc>().add(GetAllUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          boxShadow: [AppShadow.defShadow],
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * .25,
                  child: const CustomTextField(
                    backgroundColor: ColorName.backgroundColor,
                    hintText: "Search",
                    leading: Padding(
                      padding: EdgeInsets.only(left: 25, right: 10),
                      child: Icon(Icons.search),
                    ),
                    borderColor: Colors.transparent,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                  ),
                ),
                const Spacer(),
                UI.nothing
              ],
            ),
            20.h,
            const SizedBox(
              height: 30,
              child: Row(
                children: [
                  AdminRowWidget(
                    width: 50,
                    text: '№',
                  ),
                  AdminRowWidget(
                    width: 200,
                    text: 'Name',
                  ),
                  AdminRowWidget(
                    width: 250,
                    text: 'Email',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Plan',
                  ),
                  AdminRowWidget(
                    width: 100,
                    text: 'Rating',
                    disableDivider: true,
                  ),
                ],
              ),
            ),
            10.h,
            BlocConsumer<WebBloc, WebState>(
              listener: (context, state) {},
              builder: (context, state) {
                final List<UserModel> listUsers = state.listUsers ?? [];
                if (state.getAllUsersStatus.isProgress) {
                  return UI.spinner();
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: listUsers.length,
                    itemBuilder: (_, index) => SizedBox(
                      height: 30,
                      child: AdminUsersRowWidget(
                        userModel: listUsers[index],
                        number: index,
                      ),
                    ),
                    separatorBuilder: (_, index) => 10.h,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
