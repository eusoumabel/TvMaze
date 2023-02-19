import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/design/widgets/safe_app_bar_widget.dart';
import 'package:tv_maze/app/design/widgets/safe_empty_state_widget.dart';
import 'package:tv_maze/app/modules/home/presenter/widgets/grid_tv_show_widget.dart';
import 'package:tv_maze/app/modules/search/presenter/controller/search_controller.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/state/safe_builder.dart';
import 'package:tv_maze/core/state/safe_state.dart';

class SearchPage extends StatefulWidget {
  static const route = 'search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends SafeState<SearchPage, SearchController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const SafeAppBarWidget(
        leading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToTheTop(),
        child: const Icon(Icons.arrow_upward_rounded),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.xs,
          right: context.xs,
          bottom: context.xxs,
          top: context.xxxs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeBuilder(
              stream: controller.store.isCleanButtonVisible,
              builder: (isCleanButtonVisible) {
                return TextFormField(
                  controller: controller.store.searchText,
                  onChanged: (value) {
                    controller.store.debouncer.run(() {
                      controller.searchTvShow(value);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: S.current.textSearch,
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: Theme.of(context).primaryColor,
                    suffixIcon: Visibility(
                      visible: isCleanButtonVisible,
                      child: IconButton(
                        onPressed: () => controller.onClearSearch(),
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                );
              },
            ),
            context.vSmallSpacing,
            SafeBuilder2(
              stream1: controller.store.listSearchedTvShows,
              stream2: controller.store.isSearchError,
              builder: (listSearchedTvShows, isSearchError) {
                if (isSearchError) {
                  return SafeEmptyResultWidget(
                    text: S.current.errorTvShowsNotFound,
                  );
                } else if (listSearchedTvShows.isEmpty) {
                  return const SearchOnInitialWidget();
                } else {
                  return Expanded(
                    child: GridTvShowsWidget(
                      list: listSearchedTvShows,
                      scrollController: controller.store.scrollController,
                      goToTvShow: (tvShow) => controller.goToTvShow(
                        tvShow: tvShow,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchOnInitialWidget extends StatelessWidget {
  const SearchOnInitialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          context.vSmallSpacing,
          Text('😄', style: context.h3),
          context.vSmallSpacing,
          Text(S.current.textSearchShows, style: context.h5),
        ],
      ),
    );
  }
}
