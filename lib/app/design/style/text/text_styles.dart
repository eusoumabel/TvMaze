import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle? get h1 => Theme.of(this).textTheme.headline1;
  TextStyle? get h2 => Theme.of(this).textTheme.headline2;
  TextStyle? get h3 => Theme.of(this).textTheme.headline3;
  TextStyle? get h4 => Theme.of(this).textTheme.headline4;
  TextStyle? get h5 => Theme.of(this).textTheme.headline5;
  TextStyle? get h6 => Theme.of(this).textTheme.headline6;

  TextStyle? get sub1 => Theme.of(this).textTheme.subtitle1;
  TextStyle? get sub2 => Theme.of(this).textTheme.subtitle2;

  TextStyle? get body1 => Theme.of(this).textTheme.bodyText1;
  TextStyle? get body2 => Theme.of(this).textTheme.bodyText2;

  TextStyle? get button => Theme.of(this).textTheme.button;

  TextStyle? get pH1 => Theme.of(this).primaryTextTheme.headline1;
  TextStyle? get pH2 => Theme.of(this).primaryTextTheme.headline2;
  TextStyle? get pH3 => Theme.of(this).primaryTextTheme.headline3;
  TextStyle? get pH4 => Theme.of(this).primaryTextTheme.headline4;
  TextStyle? get pH5 => Theme.of(this).primaryTextTheme.headline5;
  TextStyle? get pH6 => Theme.of(this).primaryTextTheme.headline6;

  TextStyle? get pSub1 => Theme.of(this).primaryTextTheme.subtitle1;
  TextStyle? get pSub2 => Theme.of(this).primaryTextTheme.subtitle2;

  TextStyle? get pBody1 => Theme.of(this).primaryTextTheme.bodyText1;
  TextStyle? get pBody2 => Theme.of(this).primaryTextTheme.bodyText2;

  TextStyle? get pButton => Theme.of(this).primaryTextTheme.button;
}
