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

class TeacherProfileLoadingState extends ProfileState{}
class TeacherProfileSuccessState extends ProfileState{}
class TeacherProfileErrorState extends ProfileState{}

class TeacherListLoadingState extends ProfileState{}
class TeacherListSuccessState extends ProfileState{}
class TeacherListErrorState extends ProfileState{}

class StudentListLoadingState extends ProfileState{}
class StudentListSuccessState extends ProfileState{}
class StudentListErrorState extends ProfileState{}