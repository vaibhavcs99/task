part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class FetchTaskState extends TaskState {
  final VadiateSettingRequestModel data;

  FetchTaskState({required this. data});
}
