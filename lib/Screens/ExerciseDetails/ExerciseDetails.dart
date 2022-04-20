import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/constants.dart';
import 'package:track_your_workout/Screens/HomeScreen/ExerciseBuilder.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Thursday, April 14, 2022',
            style: TextStyle(fontSize: 17),
          ),
          leading: const BackButton(
            color: kBlack,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 17.0),
                  child: Text(
                    'Back Day - 4 Exercises',
                    style: TextStyle(
                      fontSize: 25,
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ExerciseBuilder(
                      size: size,
                      reps: 15,
                      setNumber: 1,
                      weight: 40,
                      key: key,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: size.height * 0.01,
                    width: 0,
                  ),
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
