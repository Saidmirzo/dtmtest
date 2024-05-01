import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/res/res.dart';

class CarouselWidgetHome extends StatelessWidget {
  const CarouselWidgetHome({
    super.key,
    required this.carouselController,
  });

  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeBloc>()..add(GetAllCarouselImageEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getAllCarouselImageStatus == BlocStatus.inProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: state.listAdvertisiong?.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            state.listAdvertisiong?[index].image ?? '',
                          ),
                          fit: BoxFit.cover),
                      color: ColorName.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: const Offset(6, 6),
                          color: ColorName.black.withOpacity(.25),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 7,
              viewportFraction: .8,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 0,
              autoPlay: false,
              scrollPhysics: const BouncingScrollPhysics(),
            ),
          );
        },
      ),
    );
  }
}
