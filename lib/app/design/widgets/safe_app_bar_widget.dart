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
  final TextStyle? style;
  const SafeAppBarWidget({
    super.key,
    this.title = StringConstants.empty,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.leading = false,
    this.actions,
    this.style,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.xs),
      child: AppBar(
        elevation: 0,
        centerTitle: centerTitle,
        title: Text(
          title,
          style: style ?? context.h6!.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: leading
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
