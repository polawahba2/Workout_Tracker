import 'package:flutter/material.dart';

import 'constants.dart';

class SetsDetails extends StatelessWidget {
  final int setNumber;
  final int reps;
  final num weight;

  const SetsDetails({
    Key? key,
    required this.setNumber,
    required this.reps,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'set$setNumber',
            style: const TextStyle(
              color: kBlue,
            ),
          ),
          Text('$reps rep'),
          Text('$weight KG'),
        ],
      ),
    );
  }
}
