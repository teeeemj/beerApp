import 'package:teeeemj/models/beer_model.dart';

abstract class BeerState {}

class BeerInitalState extends BeerState {}

class BeerLoadingState extends BeerState {}

class BeerLoadedState extends BeerState {
  final List<BeerModel> beers;

  BeerLoadedState(this.beers);
}

// class FavoriteState extends BeerState {
//   final bool isFavorite;

//   FavoriteState(this.isFavorite);
// }

class BeerErrorState extends BeerState {
  final String error;
  BeerErrorState(this.error);
}
