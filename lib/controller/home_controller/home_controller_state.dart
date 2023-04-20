part of 'home_controller_cubit.dart';

@immutable
abstract class HomeControllerState {}

class HomeControllerInitial extends HomeControllerState {}


class MessageListLoadingState extends HomeControllerState{}
class MessageListSuccessState extends HomeControllerState{}
class MessageListErrorState extends HomeControllerState{}

class HomeworkListLoadingState extends HomeControllerState{}
class HomeworkListSuccessState extends HomeControllerState{}
class HomeworkListErrorState extends HomeControllerState{}