import 'dart:developer';

import 'package:get/get.dart';

import '../../../config/res/colors.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/utils/services/auth_service.dart';
import '../../../core/utils/services/responsive_service.dart';
import '../../data/data_source/remote_data_source/portfolio_remote_data_source.dart';
import '../../data/repositories/portfolio_repository_impl.dart';
import '../../domain/usecases/get_portfolio.dart';
import '../controller/portfolio_controller.dart';
import '../controller/profile/profile_controller.dart';
import '../controller/theme/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() async {
    // TODO: implement dependencies
    Get.put(ColorManager());
    Get.lazyPut(() => ThemeController());
// Register DioClient first
    Get.lazyPut<DioClient>(() => DioClient());

// Register PortfolioRemoteDataSourceImpl which depends on DioClient
    Get.lazyPut<PortfolioRemoteDataSourceImpl>(() =>
        PortfolioRemoteDataSourceImpl(Get.find<DioClient>())
    );

// Register PortfolioRepositoryImpl which depends on PortfolioRemoteDataSourceImpl
    Get.lazyPut<PortfolioRepositoryImpl>(() => PortfolioRepositoryImpl(Get.find<PortfolioRemoteDataSourceImpl>()));

// Register GetPortfolio which depends on PortfolioRepositoryImpl
    Get.lazyPut<GetPortfolio>(() => GetPortfolio(Get.find<PortfolioRepositoryImpl>()));

// Register PortfolioController which depends on GetPortfolio
    Get.lazyPut<PortfolioController>(() => PortfolioController(getPortfolio: Get.find<GetPortfolio>()));

  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    log('message');
  }
}