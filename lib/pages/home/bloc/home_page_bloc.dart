import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageDotsEvent>(_onHomePageDots);
  }

  void _onHomePageDots(HomePageDotsEvent event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
