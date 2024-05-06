import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/di/di.dart';
import 'package:dtmtest/features/mobile/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidgetHome extends StatefulWidget {
  const CarouselWidgetHome({
    super.key,
  });
  @override
  State<CarouselWidgetHome> createState() => _CarouselWidgetHomeState();
}

class _CarouselWidgetHomeState extends State<CarouselWidgetHome> {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeBloc>()..add(GetAllCarouselImageEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getAllCarouselImageStatus == BlocStatus.inProgress) {
            return UI.spinner();
          }
          return CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: state.listAdvertisiong?.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
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
              );
            },
            options: CarouselOptions(
              aspectRatio: 15 / 7,
              viewportFraction: .75,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
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
