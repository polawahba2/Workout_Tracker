import 'package:flutter/material.dart';
import 'package:track_your_workout/Cubit/Cubit.dart';
import 'package:track_your_workout/Screens/NewExercise/NewExercise.dart';

import 'constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Widget fistRoute;
  final Widget secoundRoute;
  final Size size;

  const CustomBottomNavBar(
      {Key? key,
      required this.size,
      required this.fistRoute,
      required this.secoundRoute,
      required context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.092,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: size.height * 0.08,
                      decoration: const BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          right: 12.0,
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.home),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: kBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: size.height * 0.08,
                      decoration: const BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 12.0,
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.history),
                            Text(
                              'History',
                              style: TextStyle(
                                color: kBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      pushOnly(route: secoundRoute, context: context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: MaterialButton(
              // color: const Color.fromARGB(255, 235, 2, 2),
              color: kBlue,
              elevation: 8.0,
              child: Icon(
                Icons.add,
                size: size.height * 0.04,
                color: kWhite,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              onPressed: () {
                pushOnly(route: const NewExercise(), context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
