import 'package:flutter/material.dart';

extension SpacingSizedBoxExtension on BuildContext {
  SizedBox get hSuperMicroSpacing => SizedBox(width: xxxs);
  SizedBox get hMicroSpacing => SizedBox(width: xxs);
  SizedBox get hSuperSmallSpacing => SizedBox(width: xs);
  SizedBox get hSmallSpacing => SizedBox(width: s);
  SizedBox get hMediumSpacing => SizedBox(width: m);
  SizedBox get hLargeSpacing => SizedBox(width: l);
  SizedBox get hSuperLargeSpacing => SizedBox(width: xl);
  SizedBox get hExtraLargeSpacing => SizedBox(width: xxl);
  SizedBox get hSuperExtraLargeSpacing => SizedBox(width: xxxl);

  SizedBox get vSuperMicroSpacing => SizedBox(height: xxxs);
  SizedBox get vMicroSpacing => SizedBox(height: xxs);
  SizedBox get vSuperSmallSpacing => SizedBox(height: xs);
  SizedBox get vSmallSpacing => SizedBox(height: s);
  SizedBox get vMediumSpacing => SizedBox(height: m);
  SizedBox get vLargeSpacing => SizedBox(height: l);
  SizedBox get vSuperLargeSpacing => SizedBox(height: xl);
  SizedBox get vExtraLargeSpacing => SizedBox(height: xxl);
  SizedBox get vSuperExtraLargeSpacing => SizedBox(height: xxxl);
}

extension SpacingExtension on BuildContext {
  double get xxxxxs => 2;
  double get xxxxs => 4;
  double get xxxs => 8;
  double get xxs => 12;
  double get xs => 16;
  double get s => 24;
  double get m => 32;
  double get l => 40;
  double get xl => 48;
  double get xxl => 64;
  double get xxxl => 80;
  double get xxxxl => 96;
  double get xxxxxl => 160;
}
