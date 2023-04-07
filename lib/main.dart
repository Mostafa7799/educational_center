import 'package:educational_center/controller/auth_controller/auth_cubit.dart';
import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/screens/auth/LoginScreen.dart';
import 'package:educational_center/screens/home/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/pref.dart';
import 'data/dio_helper/dio_helper.dart';

String? accessToken;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  accessToken = await SharedPreferencesHelper.getAccessToken();
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
            primarySwatch: Colors.blue,
          ),
          home: accessToken != null ? const LayoutScreen() : const LoginPage()),
    );
  }
}