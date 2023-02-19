import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_loading.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/constants/string_constants.dart';

class TvShowWidget extends StatelessWidget {
  final TvShowEntity tvShow;
  final Function()? onTap;
  const TvShowWidget({
    super.key,
    required this.tvShow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tvShow.id!,
      child: GestureDetector(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: tvShow.image?.original ?? StringConstants.empty,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(context.xxxs),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (_, url) => const Center(child: SafeLoading()),
                errorWidget: (_, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.grey.shade800.withOpacity(0.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(context.xxxs),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.xxs),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        tvShow.name!,
                        style: context.h6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
