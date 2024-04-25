// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/mobile/category/presentation/bloc/category_bloc.dart';
import 'package:dtmtest/features/mobile/category/presentation/widgets/category_custom_container.dart';
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          // text: 'Tarix',
          child: CustomTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Assets.icons.searchIcon.svg(
                width: 30,
                height: 25,
                fit: BoxFit.scaleDown,
              ),
            ),
            radius: 10,
            backgroundColor: ColorName.white,
            // height: 40,
            controller: textEditingController,
            hintText: 'Fanlar',
            style: AppTextStyles.body24w7.copyWith(
              color: ColorName.customColor,
            ),
            hintStyle: AppTextStyles.body24w7.copyWith(
              color: ColorName.customColor,
            ),
          ),
        ),
        body: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.getAllCategoriesStatus == BlocStatus.inProgress) {
              return UI.spinner();
            }
            return Column(
              children: [
                30.h,
                Expanded(
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
                      itemCount: state.listCategories?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 150 / 130,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCustomContainer(
                          index: index,
                          scienceName: state.listCategories?[index].name ?? '',
                          child: Assets.images.bookImage.image(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
