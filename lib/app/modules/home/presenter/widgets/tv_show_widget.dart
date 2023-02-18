import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_loading.dart';
import 'package:tv_maze/app/modules/home/domain/entities/tv_show_entity.dart';
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
    return GestureDetector(
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
              errorWidget: (_, url, error) => const Icon(Icons.error),
            ),
            //TODO add like button
            // Positioned(
            //   top: context.xxs,
            //   right: context.xxxxxs,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       fixedSize: const Size(50, 50),
            //       shape: const CircleBorder(),
            //     ),
            //     child: const Icon(Icons.thumb_up_rounded),
            //   ),
            // ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).cardColor.withOpacity(0),
                      Theme.of(context).cardColor,
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
