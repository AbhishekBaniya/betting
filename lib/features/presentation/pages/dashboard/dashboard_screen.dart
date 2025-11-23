import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesbetting/features/presentation/pages/dashboard/team_card.dart';
import 'package:salesbetting/features/presentation/widgets/app_parent_widget.dart';
import '../../../../core/utils/extensions/responsive_num_extensions.dart';
import '../../../../core/utils/services/responsive_service.dart';
import '../../controller/dashboard/dashboard_controller.dart';
import '../../controller/portfolio_controller.dart';
import 'event_card.dart';

// class DashboardScreen extends StatelessWidget {
//
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(DashboardController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sales Bets Dashboard'),
//       ),
//       body: Obx(() {
//         return SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Ongoing Challenges', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: controller.events.length,
//                   itemBuilder: (context, index) {
//                     final event = controller.events[index];
//                     return EventCard(event: event);
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Trending Teams', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: controller.trendingTeams.length,
//                   itemBuilder: (context, index) {
//                     final team = controller.trendingTeams[index];
//                     return TeamCard(team: team);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }


class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});


  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {

    return AppParentWidget(
      appBar: AppBar(
        title: Text(
          'Sales Bets Dashboard',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: ResponsiveEdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ongoing Challenges Section
              Text(
                'Ongoing Challenges',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 220.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.events.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final event = controller.events[index];
                    return EventCard(event: event);
                  },
                ),
              ),
              SizedBox(height: 24.h),

              // Trending Teams Section
              Text(
                'Trending Teams',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 220.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.trendingTeams.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final team = controller.trendingTeams[index];
                    return TeamCard(team: team);
                  },
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        );
      }),
    );
  }
}
