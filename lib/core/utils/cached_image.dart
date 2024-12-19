import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:washify_mobile/core/network/api_constant.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // final globalVariables = GlobalVariables();
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:ApiConstance.siteUrl+ imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            width: width,
            height: height,
            child: Container(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 50,
        color: Colors.black,
      ),
    );
  }
}
