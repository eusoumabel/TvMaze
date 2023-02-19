import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';

class SafeEmptyResultWidget extends StatelessWidget {
  final String text;
  const SafeEmptyResultWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('😔', style: context.h3),
          Text(text, style: context.h5),
        ],
      ),
    );
  }
}
