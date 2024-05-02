import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    context.read<AuthBloc>().add(GetLocaleUserEvent());
  }

  String timeFunction() {
    int dateTime = DateTime.now().hour;
    if (dateTime <= 9) {
      return "Hayrli tong";
    } else if (dateTime <= 17) {
      return "Hayrli kun";
    } else if (dateTime <= 22) {
      return "Hayrli kech";
    } else if (dateTime <= 4 || dateTime <= 24) {
      return "Hayrli tun";
    }
    return "Hayrli kun";
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorName.white,
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                        color: ColorName.borderColor,
                      ),
                      child: CustomNetworkImage(
                        networkImage:
                            context.read<AuthBloc>().state.userModel?.userImage,
                        defWidget: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Assets.icons.profileBold.svg(
                            width: 40,
                            height: 40,
                          ),
                        ),
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
                          context.read<AuthBloc>().state.userModel?.fullName ??
                              '',
                          style: AppTextStyles.body20w7.copyWith(
                            color: ColorName.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // ignore: deprecated_member_use_from_same_package
                    Assets.icons.notification.svg(
                      // ignore: deprecated_member_use_from_same_package
                      color: ColorName.grey[500],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselWidgetHome(carouselController: carouselController),
            ),
            SliverToBoxAdapter(
              child: 30.h,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 110,
                child: BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.getAllCategoriesStatus == BlocStatus.inProgress) {
                      return UI.spinner();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.listCategories?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(
                                ThemesRoute(
                                  categoryModel:
                                      (state.listCategories?[index])!,
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 110,
                              width: 150,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                          color:
                                              ColorName.black.withOpacity(.25),
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
                          ),
                        );
                      },
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
