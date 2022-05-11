import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_workout/Compounent/constants.dart';
import 'package:track_your_workout/Cubit/Cubit.dart';
import 'package:track_your_workout/Cubit/States.dart';

class NewExercise extends StatelessWidget {
  NewExercise({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController exerciseOfDayNameController = TextEditingController();
  TextEditingController exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myCubit = AppCubit.getCubit(context);
    return BlocConsumer<AppCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: kWhite,
              appBar: AppBar(
                title: Text(
                  myCubit.exersiceIsStart
                      ? 'New ${exerciseOfDayNameController.text} Exercise'
                      : '',
                ),
                leading: const BackButton(
                  color: kBlack,
                ),
              ),
              body: !myCubit.exersiceIsStart
                  ? beforeStartingTheExercise(context)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dead lift',
                              style: TextStyle(
                                  fontSize: size.height * 0.027,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.017,
                                    left: size.height * 0.015,
                                    right: size.height * 0.017,
                                    bottom: size.height * 0.017,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(' '),
                                          Text('Reps'),
                                          Text('weight'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('#${index + 1}'),
                                              SizedBox(
                                                width: size.width * 0.12,
                                                child: const TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.12,
                                                child: const TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: 'kg',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: myCubit.numberOfSets,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SizedBox(
                                          height: 6,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              myCubit.addNewExercise();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder(),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: size.height * 0.03,
                                              color: kWhite,
                                            ),
                                          ),
                                          if (myCubit.numberOfSets != 0)
                                            ElevatedButton(
                                              onPressed: () {
                                                myCubit.removeExercise();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  Colors.red,
                                                ),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  const CircleBorder(),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                size: size.height * 0.03,
                                                color: kWhite,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            SizedBox(
                              height: size.height * 0.055,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(context);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Add Exercise',
                                  style: TextStyle(color: kWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        });
  }

  Widget beforeStartingTheExercise(context) => Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 5,
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Start The Exersice',
              style: TextStyle(fontSize: 17),
            ),
          ),
          onPressed: () {
            showStartExercisetDialog(context);
          },
        ),
      );

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Exersice Name'),
          content: TextField(
            controller: exerciseNameController,
            decoration: const InputDecoration(hintText: "Squat for example"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                exerciseNameController.text = '';
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void showStartExercisetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('What are you going to train today?'),
          content: TextField(
            controller: exerciseOfDayNameController,
            decoration: const InputDecoration(hintText: "EX: Back Day "),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                AppCubit.getCubit(context).startExersice();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
