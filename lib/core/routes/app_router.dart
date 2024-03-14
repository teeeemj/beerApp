import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teeeemj/ui/screens/beer_page.dart';
import 'package:teeeemj/ui/screens/favorite_page.dart';
import 'package:teeeemj/ui/screens/home_page.dart';
import 'package:teeeemj/ui/screens/onboarding.dart';
import 'package:teeeemj/ui/screens/sign_in_page.dart';
import 'package:teeeemj/ui/screens/sign_up_page.dart';
import 'package:teeeemj/ui/widgets/favorite_beers.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: BeerRoute.page,
        ),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(
          page: OnBoardingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        )
      ];
}
