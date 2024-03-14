import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BeerPage extends StatelessWidget {
  final String beerName;
  final String firstBrewed;
  final String imgUrl;
  final String price;
  final String description;
  const BeerPage(
      {super.key,
      required this.beerName,
      required this.firstBrewed,
      required this.imgUrl,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4C314),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 55),
                      Text(
                        beerName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 45),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        firstBrewed,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        price,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dialogBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 132,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.orange,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Description',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                            const SizedBox(height: 21),
                            Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 7,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).highlightColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Positioned(
                  right: 120,
                  bottom: 120,
                  top: 0,
                  child: Image.network(
                    imgUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 50,
                  bottom: 120,
                  top: 0,
                  child: Image.network(
                    imgUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 85,
                  bottom: 100,
                  top: 0,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      imgUrl,
                      // height: 50,
                      // width: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
