part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CoursesListLoadingState extends CourseState{}
class CoursesListSuccessState extends CourseState{}
class CoursesListErrorState extends CourseState{}

class TopThreeLoadingState extends CourseState{}
class TopThreeSuccessState extends CourseState{}
class TopThreeErrorState extends CourseState{}

class TodayCoursesListLoadingState extends CourseState{}
class TodayCoursesListSuccessState extends CourseState{}
class TodayCoursesListErrorState extends CourseState{}