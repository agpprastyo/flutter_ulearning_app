part of 'home_page_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDotsEvent extends HomePageEvent {
  final int index;

  HomePageDotsEvent(this.index);
}
