import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_you_event.dart';
import 'about_you_state.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';

class AboutYouBloc extends Bloc<AboutYouEvent, AboutYouState> {
  AboutYouBloc() : super(const AboutYouState()) {
    on<AboutYouSubmitted>((event, emit) {
      appLog.i('About you submitted, previous state: ${state.done}');
      emit(const AboutYouState(done: true));
      appLog.i('About you submitted, new state: ${state.done}');
    });
  }
}
