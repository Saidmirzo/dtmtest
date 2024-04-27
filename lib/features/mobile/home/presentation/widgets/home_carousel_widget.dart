import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../common/res/res.dart';

class CarouselWidgetHome extends StatelessWidget {
  const CarouselWidgetHome({
    super.key,
    required this.carouselController,
  });

  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Container(
              width: 270,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
        viewportFraction: .7,
        reverse: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        initialPage: 1,
        autoPlay: false,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
