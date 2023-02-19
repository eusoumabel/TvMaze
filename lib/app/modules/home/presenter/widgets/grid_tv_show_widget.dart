import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/app/modules/home/presenter/widgets/tv_show_widget.dart';

typedef TvShowCallback = void Function(TvShowEntity tvShow);

class GridTvShowsWidget extends StatelessWidget {
  final List<TvShowEntity> list;
  final ScrollController scrollController;
  final TvShowCallback goToTvShow;
  const GridTvShowsWidget({
    Key? key,
    required this.list,
    required this.scrollController,
    required this.goToTvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(bottom: context.s),
      controller: scrollController,
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: context.xxs,
      mainAxisSpacing: context.xxs,
      childAspectRatio: 0.7,
      children: List.generate(
        list.length,
        (index) => TvShowWidget(
          tvShow: list[index],
          onTap: () => goToTvShow(list[index]),
        ),
      ),
    );
  }
}
