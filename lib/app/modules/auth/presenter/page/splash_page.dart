import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tv_maze/app/design/style/spacing/spacing_style.dart';
import 'package:tv_maze/app/design/style/text/text_styles.dart';
import 'package:tv_maze/app/modules/auth/presenter/controller/splash_controller.dart';
import 'package:tv_maze/core/constants/assets_constants.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/state/safe_state.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SafeState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SvgPicture.asset(
                AssetsConstants.tv,
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            context.vSuperSmallSpacing,
            Text(
              S.current.textTvMaze,
              textAlign: TextAlign.center,
              style: context.h1?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
