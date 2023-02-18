import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/modules/home/presenter/controller/home_controller.dart';
import 'package:tv_maze/app/modules/home/presenter/widgets/tv_show_widget.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/state/safe_builder.dart';
import 'package:tv_maze/core/state/safe_state.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends SafeState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: context.s,
          right: context.s,
          top: context.xxxl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              readOnly: true,
              onTap: () {},
              decoration: InputDecoration(
                labelText: S.current.textSearch,
                prefixIcon: const Icon(Icons.search_rounded),
                prefixIconColor: Theme.of(context).primaryColor,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            //TODO add favorite tv shows
            context.vSmallSpacing,
            Text(
              S.current.textAllTvShows,
              style: context.h4!.copyWith(fontWeight: FontWeight.bold),
            ),
            context.vSmallSpacing,
            SafeBuilder(
              stream: controller.store.listTvShows,
              builder: (listTvShows) {
                if (listTvShows.isEmpty) {
                  //TODO add empty state

                }
                return Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: context.xxs,
                    mainAxisSpacing: context.xxs,
                    childAspectRatio: 0.7,
                    children: List.generate(
                      listTvShows.length,
                      (index) => TvShowWidget(tvShow: listTvShows[index]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
