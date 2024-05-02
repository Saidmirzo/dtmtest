// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/custom_image_changer.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/res/app_router.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.getAllCategoriesStatus == BlocStatus.inProgress) {
            return UI.spinner();
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Categories",
                  style:
                      AppTextStyles.body20w5.copyWith(color: ColorName.white),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: ColorName.white,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ).copyWith(top: 30, bottom: 30),
                    itemCount: state.listCategories?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 150 / 130,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) {
                      return CustomImageChangerWidget(
                        border: Border.all(color: ColorName.customColor),
                        borderRadiusDef: BorderRadius.circular(15),
                        file: null,
                        image: state.listCategories?[index].image,
                        onTap: () {
                          context.pushRoute(
                            ThemesRoute(
                                categoryModel: state.listCategories?[index]),
                          );
                        },
                        child: state.listCategories?[index].isActive ?? false
                            ? const SizedBox.shrink()
                            : Container(
                                alignment: Alignment.center,
                                color: ColorName.white.withOpacity(0.5),
                                child: Assets.icons.closed.svg(
                                    width: 50, color: ColorName.customColor),
                              ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
