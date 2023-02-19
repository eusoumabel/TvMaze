import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_app_bar_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/controller/tv_show_controller.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_episode_modal_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_genres_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_image_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_rating_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_runtime_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_schedule_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_seasons_widget.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/widgets/tv_show_summary_widget.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/state/safe_builder.dart';
import 'package:tv_maze/core/state/safe_state.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';

class TvShowPage extends StatefulWidget {
  static const route = 'tvShow';
  final TvShowEntity tvShow;
  const TvShowPage({
    super.key,
    required this.tvShow,
  });

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends SafeState<TvShowPage, TvShowController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    controller.store.tvShow.data = widget.tvShow;

    return Scaffold(
      appBar: SafeAppBarWidget(
        title: widget.tvShow.name ?? StringConstants.empty,
        style: context.sub1!.copyWith(fontWeight: FontWeight.bold),
        leading: true,
      ),
      body: SafeBuilder(
        stream: controller.store.tvShow,
        builder: (tvShow) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              left: context.xs,
              right: context.xs,
              bottom: context.xxl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: tvShow?.id ?? StringConstants.empty,
                      child: TvShowImageWidget(image: tvShow?.image?.original),
                    ),
                  ],
                ),
                context.vMediumSpacing,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TvShowRatingWidget(rating: tvShow?.rating?.average),
                    context.hSuperSmallSpacing,
                    Text(StringConstants.hyphen, style: context.body2),
                    context.hSuperSmallSpacing,
                    TvShowRuntimeWidget(runtime: tvShow?.averageRuntime),
                  ],
                ),
                context.vMediumSpacing,
                TvShowGenresWidget(genres: tvShow?.genres),
                context.vMediumSpacing,
                TvShowSummaryWidget(summary: tvShow?.summary),
                context.vMediumSpacing,
                TvShowScheduleWidget(scheduleText: controller.scheduleText),
                context.vMediumSpacing,
                Text(
                  S.current.textSeasons,
                  style: context.h6!.copyWith(fontWeight: FontWeight.bold),
                ),
                SafeBuilder2(
                  stream1: controller.store.seasons,
                  stream2: controller.store.episodes,
                  builder: (seasons, episodes) {
                    return TvShowSeasonsWidget(
                      episodes: episodes,
                      seasons: seasons,
                      onTapEpisode: (episode) => showModalBottomSheet(
                        context: context,
                        builder: (context) => EpisodeModalWidget(
                          episode: episode,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
