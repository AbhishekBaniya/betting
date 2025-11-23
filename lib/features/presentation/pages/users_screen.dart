import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/res/dims.dart';
import '../app_routes/app_navigators.dart';
import '../app_routes/app_routes.dart';
import '../controller/portfolio_controller.dart';
import '../widgets/app_circular_indicator_widget.dart';
import '../widgets/app_parent_widget.dart';
import '../widgets/app_text_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final PortfolioController controller = Get.put(PortfolioController(getPortfolio: Get.find()));

  @override
  Widget build(BuildContext context) {
    return AppParentWidget(
      resizeToAvoidBottomInset: true,
      screenBgColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: RandomColorProgressIndicator(),);
        } else if (controller.hasError.value) {
          return Center(child: AppRichTextWidget().buildRichText(text1: 'Error loading portfolio', textAlign: TextAlign.center, style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),),);
        } else {
          return ListView.separated(
            padding: EdgeInsets.all(Dim.doubleZero),
            itemCount: controller.portfolioItems.length,
            itemBuilder: (context, index) {
              final item = controller.portfolioItems[index];
              return InkWell(onTap: () {
                Map<String, dynamic> dataToSend = {
                  "id": item.id,
                  "name": item.name,
                  "amount": item.phone,
                };
                //AppNavigator().navigateTo(AppRoutes.selectService, arguments: dataToSend);
              }, child: Container(alignment: Alignment.centerLeft,height: 50, width: Get.width, color: Colors.white, child: ListTile(leading: Icon(Icons.star, color: Color(0xFF209FA7),), title: AppRichTextWidget().buildRichText(text1: item.name, textAlign: TextAlign.start, style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),trailing: AppRichTextWidget().buildRichText(text1: 'Click Here', textAlign: TextAlign.start, style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF209FA7),),),),),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
          );
        }
      }),
    );
  }
}