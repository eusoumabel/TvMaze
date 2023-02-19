import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/l10n/l10n.dart';

class SafeSummaryWidget extends StatefulWidget {
  final String? summary;

  const SafeSummaryWidget({
    Key? key,
    required this.summary,
  }) : super(key: key);

  @override
  State<SafeSummaryWidget> createState() => _SafeSummaryWidgetState();
}

class _SafeSummaryWidgetState extends State<SafeSummaryWidget> {
  bool _isTextExpanded = false;
  String _textSeeMore = S.current.textSeeMore;
  int maxLength = 200;

  String get summary {
    if ((widget.summary?.length ?? 0) <= maxLength) {
      return widget.summary ?? StringConstants.empty;
    }
    return '${widget.summary?.substring(0, maxLength)}${StringConstants.ellipsis}';
  }

  void doSeeMore() {
    setState(() {
      _isTextExpanded = !_isTextExpanded;
      if (_isTextExpanded) {
        _textSeeMore = S.current.textSeeLess;
      } else {
        _textSeeMore = S.current.textSeeMore;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _isTextExpanded
                  ? widget.summary ?? StringConstants.empty
                  : summary,
              style: context.body1,
            ),
            context.vSuperSmallSpacing,
            Visibility(
              visible: (widget.summary?.length ?? 0) >= 200,
              child: GestureDetector(
                onTap: doSeeMore,
                child: _textSeeMore != S.current.textSeeMore
                    ? Text(_textSeeMore,
                        style: context.button!.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ))
                    : Text(_textSeeMore,
                        style: context.button!.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
