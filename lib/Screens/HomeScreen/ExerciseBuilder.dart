import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/SetDetails.dart';

import '../../Compounent/constants.dart';

class ExerciseBuilder extends StatelessWidget {
  final Size size;
  final int setNumber;
  final int reps;
  final num weight;
  const ExerciseBuilder({
    Key? key,
    required this.size,
    required this.setNumber,
    required this.reps,
    required this.weight,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 3.0, bottom: 3.0, left: 8.0, right: 6.0),
              child: Text(
                'Pull Over - 4 sets ',
                style: TextStyle(
                  color: kWhite,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SetsDetails(
              setNumber: setNumber,
              reps: reps,
              weight: weight,
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 0,
            width: 0,
          ),
          itemCount: 4,
        ),
      ],
    );
  }
}
