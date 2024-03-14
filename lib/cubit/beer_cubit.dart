import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teeeemj/cubit/beer_state.dart';
import 'package:teeeemj/repository/beer_repository.dart';

class BeerCubit extends Cubit<BeerState> {
  final BeerRepository repository;
  BeerCubit(this.repository) : super(BeerInitalState());

  Future<void> fetchBeer() async {
    emit(BeerLoadingState());

    try {
      final response = await repository.getBeers();
      emit(BeerLoadedState(response));
    } catch (e) {
      emit(BeerErrorState(e.toString()));
    }
  }

  // void addToFavorite() {
  //   emit(FavoriteState(true));
  // }
}
