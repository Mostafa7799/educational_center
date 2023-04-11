part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectListLoadingState extends SubjectState{}
class SubjectListSuccessState extends SubjectState{}
class SubjectListErrorState extends SubjectState{}