import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teeeemj/core/routes/app_router.dart';
import 'package:teeeemj/cubit/beer_cubit.dart';
import 'package:teeeemj/cubit/beer_state.dart';
import 'package:teeeemj/cubit/theme_cubit/theme_cubit.dart';
import 'package:teeeemj/models/beer_model.dart';
import 'package:teeeemj/ui/widgets/beer_item_containers.dart';
import 'package:teeeemj/ui/widgets/favorite_beers.dart';
import 'package:teeeemj/ui/widgets/responsive_container.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  final FavoriteBeerService? favoriteBeerService;
  const HomePage({Key? key, this.favoriteBeerService}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _visibleBeerCount = 6;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<BeerCubit>();
      cubit.fetchBeer();
    });
  }

  void _showMoreBeers(List<BeerModel> beers) {
    setState(() {
      _visibleBeerCount = beers.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 70,
                ),
                const SizedBox(height: 20),
                FutureBuilder<User?>(
                  future: FirebaseAuth.instance.authStateChanges().first,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      User? user = snapshot.data;
                      String email = user!.email ?? 'no email';
                      return Text(
                        email,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    } else {
                      return const Text('User not logged in');
                    }
                  },
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    FirebaseAuth.instance.signOut();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('token');
                    context.router.replace(const OnBoardingRoute());
                  },
                  iconSize: 45,
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Drawer();
          //   },
          //   icon: const Icon(
          //     Icons.person_outline,
          //   ),
          // ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<ThemeCubit>().setThemeBrightness();
              },
              icon: Icon(
                context.watch<ThemeCubit>().state.brightness == Brightness.light
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ResponsiveContainer(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                color: const Color(0xffF4C314),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/pngs/banner.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 80,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return ResponsiveContainer(
                      height: double.infinity,
                      width: 70,
                      color: Theme.of(context).cardColor,
                      child: const Icon(Icons.wine_bar_outlined),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: BlocBuilder<BeerCubit, BeerState>(
                  builder: (context, state) {
                    if (state is BeerLoadingState || state is BeerInitalState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BeerLoadedState) {
                      final beers = state.beers;
                      log(state.toString());
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: _visibleBeerCount,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final beer = beers[index];
                                final beerName = beer.name;

                                return BeerItemContainers(
                                  beer: beer,
                                  price: '\$ 4.23',
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    color: Theme.of(context).focusColor,
                                  ),
                                  favorite: () {
                                    if (beer.name != null) {
                                      widget.favoriteBeerService
                                          ?.addToFavorites(
                                        FavoriteBeer(
                                          beerName: beer.name ?? '',
                                          imgUrl: beer.imageUrl ?? '',
                                        ),
                                      );
                                    }
                                  },
                                  onPressed: () {
                                    // final price = '2323';
                                    if (beerName != null &&
                                        beerName.isNotEmpty) {
                                      context.router.push(BeerRoute(
                                        beerName: beerName,
                                        firstBrewed: beer.firstBrewed!,
                                        imgUrl: beer.imageUrl!,
                                        description: beer.description!,
                                        price: '\$ 4.23',
                                      ));
                                    } else {
                                      log('Here is null');
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          if (_visibleBeerCount < beers.length)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () => _showMoreBeers(beers),
                              child: const Text(
                                'Show more',
                                style: TextStyle(color: Color(0xffF4C314)),
                              ),
                            ),
                        ],
                      );
                    } else if (state is BeerErrorState) {
                      return (Center(
                        child: Text(state.error),
                      ));
                    }
                    return Center(
                      child: Text(state.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
