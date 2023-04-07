part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class StudentProfileLoadingState extends ProfileState{}
class StudentProfileSuccessState extends ProfileState{}
class StudentProfileErrorState extends ProfileState{}

class UpdateStudentLoadingState extends ProfileState{}
class UpdateStudentSuccessState extends ProfileState{}
class UpdateStudentErrorState extends ProfileState{}