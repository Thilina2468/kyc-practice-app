import 'package:flutter_bloc/flutter_bloc.dart';
import 'work_permit_event.dart';
import 'work_permit_state.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';

class WorkPermitBloc extends Bloc<WorkPermitEvent, WorkPermitState> {
  WorkPermitBloc() : super(const WorkPermitState()) {
    on<WorkPermitSubmitted>((event, emit) {
      appLog.i('Work permit submitted, previous state: ${state.done}');
      emit(const WorkPermitState(done: true));
      appLog.i('Work permit submitted, new state: ${state.done}');
    });
  }
}
