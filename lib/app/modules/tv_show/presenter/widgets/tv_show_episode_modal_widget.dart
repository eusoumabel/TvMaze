import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_image_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_rating_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_runtime_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_summary_widget.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';

class EpisodeModalWidget extends StatelessWidget {
  final EpisodeEntity episode;
  const EpisodeModalWidget({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.s,
          vertical: context.m,
        ),
        child: Column(
          children: [
            EpisodeModalHeaderWidget(name: episode.name),
            context.vSmallSpacing,
            EpisodeModalSeasonEpisodeWidget(
              seasonNum: episode.season,
              episodeNum: episode.number,
            ),
            context.vSmallSpacing,
            TvShowImageWidget(
              image: episode.image?.original,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            context.vMediumSpacing,
            Row(
              children: [
                TvShowRatingWidget(rating: episode.rating?.average),
                context.hMediumSpacing,
                Text(StringConstants.hyphen, style: context.body2),
                context.hSuperSmallSpacing,
                TvShowRuntimeWidget(runtime: episode.runtime),
              ],
            ),
            context.vMediumSpacing,
            TvShowSummaryWidget(summary: episode.summary),
          ],
        ),
      ),
    );
  }
}

class EpisodeModalSeasonEpisodeWidget extends StatelessWidget {
  final num? episodeNum;
  final num? seasonNum;
  const EpisodeModalSeasonEpisodeWidget({
    Key? key,
    required this.episodeNum,
    required this.seasonNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.current.textSeason(seasonNum ?? 0),
          style: context.sub1?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        context.hSuperSmallSpacing,
        Text(
          S.current.textEdisodeNum(episodeNum ?? 0),
          style: context.sub2,
        ),
      ],
    );
  }
}

class EpisodeModalHeaderWidget extends StatelessWidget {
  final String? name;

  const EpisodeModalHeaderWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            name ?? StringConstants.empty,
            style: context.h4?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () => Modular.to.pop(),
          icon: Icon(
            Icons.close_rounded,
            size: context.m,
          ),
        ),
      ],
    );
  }
}
