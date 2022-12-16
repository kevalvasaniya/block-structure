import 'package:bloc_project_structure/manager/manager.dart';
import 'package:bloc_project_structure/presentation/bloc/home/home_event.dart';
import 'package:bloc_project_structure/presentation/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc (HomeState initialState) : super(initialState) {
    on<InitHomeAPIDataEvent>(_callHomeDataApiToState);
  }

  /// Insert notification massage
  Future<void> _callHomeDataApiToState(InitHomeAPIDataEvent event, emit)  async {
    emit(ShowStartLoaderState());

    print("Hello");
    await GetIt.instance<Manager>().homeManager.getHomeAPIData();

    emit(HomeInitialState());
    emit(ShowEndLoaderState());
  }

}
