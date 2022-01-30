import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api_connection.dart';
import '../model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    // on<TaskEvent>((event, emit) {});
    on<FetchTaskEvent>((event, emit) async {
      VadiateSettingRequestModel data = await getHttp();
      emit(FetchTaskState(data: data));
    });

  }
}
