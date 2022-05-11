import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_workout/Compounent/constants.dart';
import 'package:track_your_workout/Cubit/Cubit.dart';

import 'Cubit/BlocObserver.dart';
import 'Screens/HomeScreen/HomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );
  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AppCubit(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontSize: 25,
                  color: kBlack,
                ),
              ),
            ),
            home: HomeScreen(),
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
