import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/constants.dart';
import 'package:track_your_workout/Screens/HistoryScreen/ExerciseNameContainer.dart';
import 'package:track_your_workout/Screens/HistoryScreen/HistoryScreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:track_your_workout/Compounent/CustomButtomNavBar.dart';
import 'package:track_your_workout/Screens/HomeScreen/ExerciseBuilder.dart';

import '../../Compounent/SeperatorContainer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: const Text(
          'WorkOut Tracker',
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.5,
                      child: SfCalendar(
                        view: CalendarView.month,
                        firstDayOfWeek: 6,
                        backgroundColor: kWhite,
                        onTap: (CalendarTapDetails details) {
                          date = details.date!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: double.infinity,
                      color: kWhite,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Exercise ',
                              style: TextStyle(
                                color: kBlack,
                                fontSize: size.height * 0.023,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 7.0, bottom: 7.0),
                              child: SeperatorContainer(),
                            ),
                            const ExerciseNameContainer(exerciseDate: 'Back '),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Spacer(),
          CustomBottomNavBar(
            size: size,
            fistRoute: HomeScreen(),
            secoundRoute: const HistoryScreen(),
            context: context,
          )
        ],
      ),
    );
  }
}
