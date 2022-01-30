part of 'bottomnav_bloc.dart';

@immutable
abstract class BottomnavEvent {}

class PageChangeEvent extends BottomnavEvent {
  final int selctedPage;

  PageChangeEvent({required this.selctedPage});
}
