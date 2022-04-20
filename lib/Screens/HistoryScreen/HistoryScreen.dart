import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_workout/Cubit/Cubit.dart';
import 'package:track_your_workout/Cubit/States.dart';

import '../../Compounent/constants.dart';
import 'ExerciseNameContainer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
      listener: (context, state) {},
      builder: ((context, state) {
        var size = MediaQuery.of(context).size;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Your Exercises',
                style: TextStyle(
                  fontSize: 30,
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              titleSpacing: 0,
              leading: const BackButton(
                color: kBlack,
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 7.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 17.0, top: 28),
                    //   child: SizedBox(
                    //     height: 55,
                    //     child: ListView.separated(
                    //       physics: const BouncingScrollPhysics(),
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return const ExercisesContainer(
                    //           exerciseName: 'Sholder',
                    //         );
                    //       },
                    //       separatorBuilder: (context, index) => const SizedBox(
                    //         width: 10,
                    //       ),
                    //       itemCount: 5,
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return const ExerciseNameContainer(
                            exerciseDate: 'Thursday, April 14, 2022',
                          );
                        },
                        separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 7.0),
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                        itemCount: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
