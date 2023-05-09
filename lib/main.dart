import 'package:educational_center/controller/auth_controller/auth_cubit.dart';
import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:educational_center/controller/home_controller/home_controller_cubit.dart';
import 'package:educational_center/controller/materila_controller/material_controller_cubit.dart';
import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/controller/quiz_controller/quiz_cubit.dart';
import 'package:educational_center/controller/subject_controller/subject_cubit.dart';
import 'package:educational_center/screens/auth/LoginScreen.dart';
import 'package:educational_center/screens/home/layout_screen.dart';
import 'package:educational_center/screens/home/teacher_home.dart';
import 'package:educational_center/screens/home/teacher_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/pref.dart';
import 'data/dio_helper/dio_helper.dart';

String? accessToken;
bool? isTeacher;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  accessToken = await SharedPreferencesHelper.getAccessToken();
  isTeacher = await SharedPreferencesHelper.getTeacher();
  DioHelper.init(token: accessToken);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///Auth Cubit
        BlocProvider(
          create: (BuildContext context) {
            return AuthCubit();
          },
        ),

        /// Profile Cubit
        BlocProvider(
          create: (BuildContext context) {
            return ProfileCubit();
          },
        ),

        /// Subject Cubit
        BlocProvider(
          create: (BuildContext context) {
            return SubjectCubit();
          },
        ),

        /// Courses Cubit
        BlocProvider(
          create: (BuildContext context) {
            return CourseCubit()..getLevelList();
          },
        ),

        /// Quizzes Cubit
        BlocProvider(
          create: (BuildContext context) {
            return QuizCubit();
          },
        ),

        /// Material Cubit
        BlocProvider(
          create: (BuildContext context) {
            return MaterialCubit();
          },
        ),
        /// Home Cubit
        BlocProvider(
          create: (BuildContext context) {
            return HomeControllerCubit();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Educational Center',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber,
            backgroundColor: Colors.white,
          ),
        ),
        home: accessToken != null
            ? isTeacher == true
                ? const TeacherLayoutScreen()
                : const LayoutScreen()
            : const LoginPage(),
      ),
    );
  }
}
