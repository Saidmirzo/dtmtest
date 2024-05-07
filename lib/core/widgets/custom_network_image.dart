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
  });
  final String? networkImage, defImage;
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
          decoration: BoxDecoration(
            color: color,
            shape: shape,

            // boxShadow: boxShadow,
            border: border,
            // borderRadius: borderRadiusDef,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
          child: defWidget),
      errorWidget: (context, url, error) {
        return defImage != null
            ? Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: shape,
                  // boxShadow: boxShadow,
                  border: border,
                  color: color,
                  // borderRadius: borderRadiusDef,
                  image: DecorationImage(
                      image: AssetImage(defImage ?? ''), fit: BoxFit.cover),
                ),
              )
            : Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: shape,
                  // boxShadow: boxShadow,
                  border: border,
                  color: color,
                  // borderRadius: borderRadiusDef,
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
