import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/constants.dart';

class NewExercise extends StatelessWidget {
  const NewExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Exercise',
        ),
        leading: const BackButton(
          color: kBlack,
        ),
      ),
    );
  }
}
