import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/style/theme/theme_styles.dart';

class SafeLoading extends StatelessWidget {
  const SafeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const Align(
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(animating: true),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: context.theme.backgroundColor,
                color: context.theme.primaryColor,
              ),
            ),
          );
  }
}
