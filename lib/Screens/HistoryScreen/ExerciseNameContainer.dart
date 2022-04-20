import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/SetDetails.dart';
import 'package:track_your_workout/Screens/ExerciseDetails/ExerciseDetails.dart';

import '../../Compounent/constants.dart';

class ExerciseNameContainer extends StatelessWidget {
  final String exerciseDate;
  const ExerciseNameContainer({Key? key, required this.exerciseDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ExpansionTile(
      title: Row(
        children: [
          Column(
            children: [
              Text(
                '20 ',
                style: TextStyle(fontSize: size.height * 0.03),
              ),
              Text(
                'April 2022',
                style: TextStyle(fontSize: size.height * 0.02),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.06,
          ),
          Text(
            'Back Exercise',
            style: TextStyle(
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      children: [
        InkWell(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kWhite,
                  Color.fromARGB(255, 172, 198, 221),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '4',
                      style: TextStyle(
                          fontSize: size.height * 0.045, color: kBlue),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text('Exersices'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '16',
                      style: TextStyle(
                          fontSize: size.height * 0.045, color: kBlue),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text('Total Stets'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '95',
                      style: TextStyle(
                          fontSize: size.height * 0.045, color: kBlue),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text('Total reps'),
                  ],
                ),
                const Text('Click for More Details'),
                SizedBox(
                  height: size.height * 0.01,
                )
              ],
            ),
          ),
          onTap: () {
            pushOnly(route: const ExerciseDetails(), context: context);
          },
        )
      ],
      childrenPadding: const EdgeInsets.only(),
      
    );
  }
}
