part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class SignUpLoadingState extends AuthState{}
class SignUpSuccessState extends AuthState{}
class SignUpErrorState extends AuthState{}


class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{}
class LoginErrorState extends AuthState{}

class LoginTeacherLoadingState extends AuthState{}
class LoginTeacherSuccessState extends AuthState{}
class LoginTeacherErrorState extends AuthState{}

class ResetLoadingState extends AuthState{}
class ResetSuccessState extends AuthState{}
class ResetErrorState extends AuthState{}


