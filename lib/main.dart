import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tv_maze/app/app_module.dart';
import 'package:tv_maze/app/app_widget.dart';
import 'package:tv_maze/core/constants/assets_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        AssetsConstants.tv,
      ),
      null,
    ),
  ]);

  return runApp(
    OverlaySupport.global(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
