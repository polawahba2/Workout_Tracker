import 'package:flutter/material.dart';
import 'package:track_your_workout/Compounent/constants.dart';

class SeperatorContainer extends StatelessWidget {
  const SeperatorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kBlack,
      height: 0.15,
    );
  }
}
