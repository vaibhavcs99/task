import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnav_event.dart';
part 'bottomnav_state.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  BottomnavBloc() : super(BottomnavInitial()) {
    // on<BottomnavEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
        on<PageChangeEvent>((event, emit) async {
      emit(PageChangeState(selctedPage: event.selctedPage));
    });
  }
}
