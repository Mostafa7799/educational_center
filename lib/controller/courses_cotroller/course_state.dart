part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CoursesListLoadingState extends CourseState{}
class CoursesListSuccessState extends CourseState{}
class CoursesListErrorState extends CourseState{}