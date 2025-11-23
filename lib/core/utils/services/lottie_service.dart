import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:salesbetting/core/utils/services/responsive_service.dart';

import '../extensions/responsive_num_extensions.dart';


class LottieService {
  // Singleton
  LottieService._internal();
  static final LottieService instance = LottieService._internal();

  final DefaultCacheManager _cacheManager = DefaultCacheManager();

  /// Load Lottie from network with caching
  Future<LottieBuilder> loadNetwork(String url, {double? width, double? height, BoxFit fit = BoxFit.contain}) async {
    // Ensure SizeService is initialized
    SizeService.instance.ensureInitialized();

    // Scale width/height if provided
    double? scaledWidth = width?.w;
    double? scaledHeight = height?.h;

    // Check cache
    final fileInfo = await _cacheManager.getFileFromCache(url);
    if (fileInfo != null) {
      return Lottie.file(
        fileInfo.file,
        width: scaledWidth,
        height: scaledHeight,
        fit: fit,
      );
    } else {
      // Download and cache
      final file = await _cacheManager.getSingleFile(url);
      return Lottie.file(
        file,
        width: scaledWidth,
        height: scaledHeight,
        fit: fit,
      );
    }
  }

  /// Load Lottie from local asset
  LottieBuilder loadAsset(String assetPath, {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    // Ensure SizeService is initialized
    SizeService.instance.ensureInitialized();

    double? scaledWidth = width != null ? width.w : null;
    double? scaledHeight = height != null ? height.h : null;

    return Lottie.asset(
      assetPath,
      width: scaledWidth,
      height: scaledHeight,
      fit: fit,
    );
  }

  /// Load Lottie from zip asset (local)
  LottieBuilder loadZipAsset(String zipAssetPath, {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    // Ensure SizeService is initialized
    SizeService.instance.ensureInitialized();

    double? scaledWidth = width?.w;
    double? scaledHeight = height?.h;

    return Lottie.asset(
      zipAssetPath,
      width: scaledWidth,
      height: scaledHeight,
      fit: fit,
    );
  }
}
