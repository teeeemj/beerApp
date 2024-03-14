// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BeerRoute.name: (routeData) {
      final args = routeData.argsAs<BeerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BeerPage(
          key: args.key,
          beerName: args.beerName,
          firstBrewed: args.firstBrewed,
          imgUrl: args.imgUrl,
          price: args.price,
          description: args.description,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          favoriteBeerService: args.favoriteBeerService,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [BeerPage]
class BeerRoute extends PageRouteInfo<BeerRouteArgs> {
  BeerRoute({
    Key? key,
    required String beerName,
    required String firstBrewed,
    required String imgUrl,
    required String price,
    required String description,
    List<PageRouteInfo>? children,
  }) : super(
          BeerRoute.name,
          args: BeerRouteArgs(
            key: key,
            beerName: beerName,
            firstBrewed: firstBrewed,
            imgUrl: imgUrl,
            price: price,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'BeerRoute';

  static const PageInfo<BeerRouteArgs> page = PageInfo<BeerRouteArgs>(name);
}

class BeerRouteArgs {
  const BeerRouteArgs({
    this.key,
    required this.beerName,
    required this.firstBrewed,
    required this.imgUrl,
    required this.price,
    required this.description,
  });

  final Key? key;

  final String beerName;

  final String firstBrewed;

  final String imgUrl;

  final String price;

  final String description;

  @override
  String toString() {
    return 'BeerRouteArgs{key: $key, beerName: $beerName, firstBrewed: $firstBrewed, imgUrl: $imgUrl, price: $price, description: $description}';
  }
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    FavoriteBeerService? favoriteBeerService,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            favoriteBeerService: favoriteBeerService,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.favoriteBeerService,
  });

  final Key? key;

  final FavoriteBeerService? favoriteBeerService;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, favoriteBeerService: $favoriteBeerService}';
  }
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}
