import 'package:flutter_bloc/flutter_bloc.dart';
import 'identity_event.dart';
import 'identity_state.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';

class IdentityBloc extends Bloc<IdentityEvent, IdentityState> {
  IdentityBloc() : super(const IdentityState()) {
    on<IdentitySubmitted>((event, emit) {
      appLog.i('Identity submitted, previous state: ${state.done}');
      emit(const IdentityState(done: true));
      appLog.i('Identity submitted, new state: ${state.done}');
    });
  }
}
