import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/constants/string_constants.dart';

class SafeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool leading;
  final String title;
  final bool centerTitle;
  const SafeAppBarWidget({
    super.key,
    this.title = StringConstants.empty,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.leading = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.xs),
      child: AppBar(
        elevation: 0,
        centerTitle: centerTitle,
        title: Text(
          title,
          style: context.h6!.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: leading
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
        surfaceTintColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
