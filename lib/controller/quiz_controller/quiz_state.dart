part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizListLoadingState extends QuizState{}
class QuizListSuccessState extends QuizState{}
class QuizListErrorState extends QuizState{}

class QuestionListLoadingState extends QuizState{}
class QuestionListSuccessState extends QuizState{}
class QuestionListErrorState extends QuizState{}
