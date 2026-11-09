import 'package:flutter_bloc/flutter_bloc.dart';
import 'billing_event.dart';
import 'billing_state.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc() : super(const BillingState()) {
    on<BillingSubmitted>((event, emit) {
      appLog.i('Billing submitted, previous state: ${state.done}');
      emit(const BillingState(done: true));
      appLog.i('Billing submitted, new state: ${state.done}');
    });
  }
}
