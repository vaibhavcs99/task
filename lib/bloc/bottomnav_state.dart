part of 'bottomnav_bloc.dart';

@immutable
abstract class BottomnavState {}

class BottomnavInitial extends BottomnavState {}

class PageChangeState extends BottomnavState {
  final int selctedPage;

  PageChangeState({required this. selctedPage});
}
