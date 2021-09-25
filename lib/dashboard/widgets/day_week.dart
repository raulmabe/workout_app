import 'package:dart_date/dart_date.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/common.dart';

class DayWeek extends StatelessWidget {
  const DayWeek({Key? key, required this.day}) : super(key: key);

  final Day day;

  @override
  Widget build(BuildContext context) {
    final indexDay = Day.values.indexOf(day);
    final todayIndexDay = DateTime.now().getWeekday - 1;
    final isToday = indexDay == todayIndexDay;

    final diffDays = indexDay - todayIndexDay;

    final currentDay = DateTime.now().day + diffDays;

    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 0.5,
          ),
        ),
        color: isToday
            ? context.theme.colorScheme.primary
            : context.theme.canvasColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text('$currentDay', style: context.theme.textTheme.headline6),
          Text(describeEnum(day).substring(0, 3).capitalize),
        ],
      ),
    );
  }
}
