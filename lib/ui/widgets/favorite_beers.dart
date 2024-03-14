class FavoriteBeer {
  final String beerName;
  final String imgUrl;

  FavoriteBeer({
    required this.beerName,
    required this.imgUrl,
  });
}

class FavoriteBeerService {
  final List<FavoriteBeer> _favoriteBeers = [];

  List<FavoriteBeer> get favoriteBeers => _favoriteBeers;

  void addToFavorites(FavoriteBeer beer) {
    _favoriteBeers.add(beer);
  }
}
