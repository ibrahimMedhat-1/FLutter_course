import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_layoutcubit_event.dart';
part 'news_layoutcubit_state.dart';

class NewsLayoutcubitBloc extends Bloc<NewsLayoutcubitEvent, NewsLayoutcubitState> {
  NewsLayoutcubitBloc() : super(NewsLayoutcubitInitial()) {
    on<NewsLayoutcubitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
