import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/responsive_num_extensions.dart';

class AchievementBadge extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const AchievementBadge({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30.r, // responsive radius
          backgroundColor: color.withOpacity(0.2),
          child: Icon(
            icon,
            color: color,
            size: 30.r, // responsive icon size
          ),
        ),
        SizedBox(height: 6.h), // responsive spacing
        SizedBox(
          width: 60.w, // constrain text width
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp, // responsive font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
