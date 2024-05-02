import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:flutter/material.dart';

class CustomImageChangerWidget extends StatelessWidget {
  const CustomImageChangerWidget({
    super.key,
    this.image,
    this.onTap,
    this.file,
    this.width,
    this.height,
    this.errorImage,
    this.child,
    this.boxShadow,
    this.border,
    this.borderRadiusDef = BorderRadius.zero,
  });

  final String? image, errorImage;
  final File? file;
  final void Function()? onTap;
  final double? width, height;
  final Widget? child;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadiusDef;
  @override
  Widget build(BuildContext context) {
    return file?.path != null
        ? Stack(
            children: [
              Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: boxShadow,
                  border: border,
                  color: ColorName.red.withOpacity(.5),
                  borderRadius: borderRadiusDef,
                  image: DecorationImage(
                    image: FileImage(file ?? File('path')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              child ?? const SizedBox.shrink()
            ],
          )
        : InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: image ?? '',
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxShadow,
                      border: border,
                      borderRadius: borderRadiusDef,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return errorImage != null
                        ? Container(
                            width: width,
                            height: height,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              border: border,
                              color: ColorName.red.withOpacity(.5),
                              borderRadius: borderRadiusDef,
                              image: DecorationImage(
                                  image: AssetImage(errorImage ?? ''),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : UI.nothing;
                  },
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(
                    strokeWidth: 2,
                    value: progress.progress,
                    color: ColorName.blue,
                    backgroundColor: Colors.grey,
                  ),
                ),
                child ?? const SizedBox.shrink()
              ],
            ),
          );
  }
}
