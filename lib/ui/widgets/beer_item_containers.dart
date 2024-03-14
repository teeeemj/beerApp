import 'package:flutter/material.dart';
import 'package:teeeemj/models/beer_model.dart';
import 'package:teeeemj/ui/widgets/responsive_container.dart';

class BeerItemContainers extends StatelessWidget {
  const BeerItemContainers({
    super.key,
    required this.beer,
    required this.favorite,
    required this.onPressed,
    required this.price,
    required this.icon,
  });

  final VoidCallback? favorite;
  final VoidCallback? onPressed;
  final BeerModel beer;
  final String price;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      color: Theme.of(context).canvasColor,
      height: 230,
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveContainer(
              width: MediaQuery.of(context).size.width * 0.20,
              height: double.maxFinite,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: favorite,
                    child: CircleAvatar(
                      radius: 17.5,
                      backgroundColor: Colors.orange.withOpacity(0.5),
                      child: icon,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Text(
                      beer.name!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    beer.firstBrewed!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 25),
                  ),
                ],
              ),
            ),
            ResponsiveContainer(
              width: MediaQuery.of(context).size.width * 0.15,
              height: double.maxFinite,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveContainer(
                    height: 100,
                    width: 50,
                    color: Colors.transparent,
                    child: Image.network(
                      beer.imageUrl!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: onPressed,
                    child: const CircleAvatar(
                      radius: 20.5,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
