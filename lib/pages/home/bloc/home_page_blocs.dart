import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);

    //new bloc
    on<HomePageCourseItem>(_homePageCourseItem);
  }
  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copywith(index: event.index));
  }

  //courseItem
  void _homePageCourseItem(
      HomePageCourseItem event, Emitter<HomePageStates> emit) {
    emit(state.copywith(courseItem: event.courseItem));
  }
}
