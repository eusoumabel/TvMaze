import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/widgets/safe_loading.dart';
import 'package:tv_maze/core/constants/string_constants.dart';

class TvShowImageWidget extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final double aspectRatio;
  final BoxFit fit;
  const TvShowImageWidget({
    Key? key,
    this.image,
    this.height,
    this.width,
    this.aspectRatio = 0.7,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * 0.3,
      width: width,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.xxxs),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: CachedNetworkImage(
            imageUrl: image ?? StringConstants.empty,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(context.xxxs),
                image: DecorationImage(
                  fit: fit,
                  image: imageProvider,
                ),
              ),
            ),
            placeholder: (_, url) => const Center(child: SafeLoading()),
            errorWidget: (_, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
