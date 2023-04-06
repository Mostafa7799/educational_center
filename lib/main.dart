import 'package:educational_center/controller/auth_controller/auth_cubit.dart';
import 'package:educational_center/screens/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/dio_helper/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return AuthCubit();
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Educational Center',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage()
      ),
    );
  }
}

