import 'package:cached_network_image/cached_network_image.dart';
import 'package:dtmtest/core/widgets/empty_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.networkImage,
    this.defImage,
    this.defWidget,
  });
  final String? networkImage;
  final String? defImage;
  final Widget? defWidget;

  @override
  Widget build(BuildContext context) {
    Widget imageProvider;
    if (networkImage != null) {
      imageProvider = CachedNetworkImage(
        imageUrl: networkImage ?? "",
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const EmptyShimmerWidget(
            size: 50,
            radius: 50,
          );
        },
      );
    } else {
      imageProvider = defWidget ??
          Image.asset(
            defImage ?? '',
            fit: BoxFit.cover,
          );
    }
    return imageProvider;
  }
}
