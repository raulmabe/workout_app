import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:workout_app/common/common.dart';
import 'package:workout_app/dashboard/widgets/charts.dart';
import 'package:workout_app/dashboard/widgets/day_week.dart';

class DashboardPage extends StatelessWidget with IllustrationsMixin {
  DashboardPage({Key? key}) : super(key: key);

  EdgeInsets get horizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromRGBO(32, 25, 45, 1),
                  // Color.fromRGBO(15, 20, 36, 1),
                  context.theme.scaffoldBackgroundColor
                      .mix(context.theme.colorScheme.primary, .1)!,
                  context.theme.scaffoldBackgroundColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                border: Border.all(style: BorderStyle.none),
                backgroundColor: Colors.transparent,
                trailing: IconButton(
                  icon: const Icon(PhosphorIcons.list),
                  onPressed: () {},
                ),
                padding: EdgeInsetsDirectional.zero,
                largeTitle: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: context.theme.textTheme.headline5?.color),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: horizontalPadding +
                            const EdgeInsets.only(bottom: 20, top: 5),
                        height: 3,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        width: context.screen.width * .2,
                      ),
                    ),
                    Padding(
                      padding: horizontalPadding,
                      child: Text(
                        'Charts',
                        style: context.theme.textTheme.headline5,
                      ),
                    ),
                    const Charts(),
                    Padding(
                      padding: horizontalPadding,
                      child: Text(
                        'Routine',
                        style: context.theme.textTheme.headline5,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Day.values
                            .map<Widget>((e) => DayWeek(day: e))
                            .embrace(const SizedBox(
                              width: 20,
                            ))
                            .toList(),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text('Day off'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
