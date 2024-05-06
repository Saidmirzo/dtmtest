import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/constants.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:dtmtest/features/mobile/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:dtmtest/features/mobile/home/widgets/home_carousel_widget.dart';
import 'package:dtmtest/features/mobile/home/widgets/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    context.read<AuthBloc>().add(GetLocaleUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomNetworkImage(
                          width: 50,
                          height: 50,

                          color: ColorName.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 192, 192),
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                          networkImage: state.userModel?.userImage,
                          defWidget: Assets.icons.profileBold.svg(
                            width: 40,
                            height: 40,
                          ),
                        ),
                        13.w,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              timeFunction(),
                              style: AppTextStyles.body12w7.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                            Text(
                              state.userModel?.fullName ?? '',
                              style: AppTextStyles.body20w7.copyWith(
                                color: ColorName.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: CarouselWidgetHome(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yangi testlarimiz",
                      style: AppTextStyles.body18w6
                          .copyWith(color: ColorName.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.tabsRouter.setActiveIndex(1);
                      },
                      child: Text(
                        "Barchasi",
                        style: AppTextStyles.body18w6
                            .copyWith(color: ColorName.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.getAllCategoriesStatus == BlocStatus.inProgress) {
                      return UI.spinner();
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 10, left: 20),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.listCategories?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(
                              ThemesRoute(
                                categoryModel: (state.listCategories?[index])!,
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            // height: 110,
                            width: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorName.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: ColorName.black.withOpacity(.25),
                                  offset: const Offset(6, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorName.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: const Offset(3, 4),
                                        color: ColorName.black.withOpacity(.25),
                                        blurStyle: BlurStyle.normal,
                                      ),
                                    ],
                                  ),
                                  child: Assets.images.bookImage.image(),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "New",
                                    style: AppTextStyles.body12w7.copyWith(
                                      color: ColorName.red,
                                    ),
                                  ),
                                ),
                                Text(
                                  state.listCategories?[index].name ??
                                      "Matematika",
                                  style: AppTextStyles.body20w7.copyWith(
                                    color: ColorName.customColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 10.w,
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: StatisticsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
