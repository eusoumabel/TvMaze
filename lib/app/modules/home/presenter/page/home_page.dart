import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/widgets/safe_app_bar_widget.dart';
import 'package:tv_maze/app/design/widgets/safe_empty_state_widget.dart';
import 'package:tv_maze/app/modules/home/presenter/controller/home_controller.dart';
import 'package:tv_maze/app/modules/home/presenter/widgets/grid_tv_show_widget.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/state/safe_builder.dart';
import 'package:tv_maze/core/state/safe_state.dart';

class HomePage extends StatefulWidget {
  static const route = '/home/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends SafeState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: SafeAppBarWidget(
        title: S.current.textAllTvShows,
        actions: [
          IconButton(
            onPressed: () => controller.goToSearchPage(),
            icon: const Icon(Icons.search_rounded, size: 30),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToTheTop(),
        child: const Icon(Icons.arrow_upward_rounded),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.xs),
        child: SafeBuilder(
          stream: controller.store.listTvShows,
          builder: (listTvShows) {
            if (listTvShows.isEmpty) {
              return SafeEmptyResultWidget(text: S.current.errorTvShows);
            }
            return GridTvShowsWidget(
              list: listTvShows,
              scrollController: controller.store.scrollController,
              goToTvShow: (tvShow) => controller.goToTvShow(tvShow: tvShow),
            );
          },
        ),
      ),
    );
  }
}
