import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../extensions/responsive_num_extensions.dart';

class SizeService {
  SizeService._internal();
  static final SizeService instance = SizeService._internal();

  // design reference (your UI's reference device dimensions)
  late double _designWidth;
  late double _designHeight;

  // device metrics (from MediaQuery at init)
  late double _deviceWidth;
  late double _deviceHeight;
  late double _pixelRatio;
  late double _textScaleFactor;

  bool _initialized = false;

  /// Initialize once in the top-level widget (requires a BuildContext)
  /// designWidth/designHeight are your reference UI sizes (e.g., 390x844 for iPhone 14)
  void init(BuildContext context, {double designWidth = 390, double designHeight = 844}) {
    final mq = MediaQuery.of(context);
    _designWidth = designWidth;
    _designHeight = designHeight;
    _deviceWidth = mq.size.width;
    _deviceHeight = mq.size.height;
    _pixelRatio = mq.devicePixelRatio;
    _textScaleFactor = mq.textScaleFactor;
    _initialized = true;
    if (kDebugMode) {
      debugPrint('SizeService initialized. device: ${_deviceWidth.toStringAsFixed(1)} x ${_deviceHeight.toStringAsFixed(1)}, scale: $_textScaleFactor');
    }
  }

  void ensureInitialized() {
    if (!_initialized) {
      throw Exception('SizeService not initialized. Call SizeService.instance.init(context) in top-level widget before using extensions.');
    }
  }

  // horizontal scale factor relative to design width
  double get _scaleWidth => _deviceWidth / _designWidth;
  // vertical scale factor relative to design height
  double get _scaleHeight => _deviceHeight / _designHeight;

  // Use a balanced scale to avoid extreme stretching on foldables/tvs
  double scaleFactorText(double value) {
    ensureInitialized();
    // Use geometric mean to avoid biasing width/height too strongly
    final s = (_scaleWidth + _scaleHeight) / 2;
    // incorporate user's accessibility textScaleFactor
    return value * s * (1 / _textScaleFactor);
  }

  double scaleRadius(double value) {
    ensureInitialized();
    // radius should follow width scale mainly
    return value * _scaleWidth;
  }

  double scaleWidthPercent(double value) {
    ensureInitialized();
    // value expected in logical px relative to design width; e.g., 40.w -> 40 logical px scaled by width
    return value * _scaleWidth;
  }

  double scaleHeightPercent(double value) {
    ensureInitialized();
    return value * _scaleHeight;
  }

  // viewport units (1.vw = 1% of device width, 1.vh = 1% of device height)
  double vw(double percent) {
    ensureInitialized();
    return (_deviceWidth * percent) / 100;
  }

  double vh(double percent) {
    ensureInitialized();
    return (_deviceHeight * percent) / 100;
  }

  // convenience getters
  double get deviceWidth {
    ensureInitialized();
    return _deviceWidth;
  }

  double get deviceHeight {
    ensureInitialized();
    return _deviceHeight;
  }

  double get textScaleFactor {
    ensureInitialized();
    return _textScaleFactor;
  }
}


// -----------------------------
// Responsive EdgeInsets and Padding helpers
// -----------------------------

class ResponsiveEdgeInsets {
  static EdgeInsets all(double value) => EdgeInsets.all(value.r);
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);
  static EdgeInsets only({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      EdgeInsets.only(left: left.w, top: top.h, right: right.w, bottom: bottom.h);
}

// Small helpers: ResponsiveSizedBox replacement — returns sized box but user can just use values directly
Widget verticalGap(double height) => SizedBox(height: height.h);
Widget horizontalGap(double width) => SizedBox(width: width.w);

// -----------------------------
// Example of using it in TextStyle and Widgets
// -----------------------------

TextStyle scaledTextStyle({double size = 14, FontWeight? weight, double letterSpacing = 0}) {
  return TextStyle(fontSize: size.sp, fontWeight: weight, letterSpacing: letterSpacing.sp);
}
