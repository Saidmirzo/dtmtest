import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.networkImage,
    this.defImage,
    this.defWidget,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.border,
    this.color,
    this.localeImage,
  });
  final String? networkImage, defImage;
  final Uint8List? localeImage;
  final Widget? defWidget;
  final BoxShape shape;
  final double? width, height;
  final BoxBorder? border;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: networkImage ?? '',
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: color,
          shape: shape,
          border: border,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
        child: defWidget ??
            (localeImage != null
                ? Image.memory(
                    localeImage!,
                    fit: BoxFit.cover,
                  )
                : null),
      ),
      errorWidget: (context, url, error) {
        return defImage != null
            ? Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: shape,
                  border: border,
                  color: color,
                  image: DecorationImage(
                    image: AssetImage(defImage ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: localeImage != null
                    ? Image.memory(localeImage!)
                    : const SizedBox.shrink(),
              )
            : Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: shape,
                  border: border,
                  color: color,
                ),
                child: defWidget,
              );
      },
      progressIndicatorBuilder: (context, url, progress) =>
          CircularProgressIndicator(
        strokeWidth: 2,
        value: progress.progress,
        color: ColorName.blue,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
