

import '../services/responsive_service.dart';

extension ResponsiveNumExtensions on num {
  /// scaled text (sp): e.g. 16.sp
  double get sp => SizeService.instance.scaleFactorText(toDouble());


  /// radius (r): e.g. 12.r
  double get r => SizeService.instance.scaleRadius(toDouble());


  /// width scaled px (w): e.g. 40.w
  double get w => SizeService.instance.scaleWidthPercent(toDouble());


  /// height scaled px (h): e.g. 18.h
  double get h => SizeService.instance.scaleHeightPercent(toDouble());


  /// viewport width percent (vw): e.g. 10.vw -> 10% of device width
  double get vw => SizeService.instance.vw(toDouble());


  /// viewport height percent (vh): e.g. 5.vh -> 5% of device height
  double get vh => SizeService.instance.vh(toDouble());


  /// shorthand vertical units: x.v -> scaled by height factor from design
  double get v => SizeService.instance.scaleHeightPercent(toDouble());


  /// shorthand horizontal units: x.hz (rare) -> scaled by width factor
  double get hz => SizeService.instance.scaleWidthPercent(toDouble());
}