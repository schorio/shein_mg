import 'package:flutter/material.dart';

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({
    super.key,
    required this.title,
    required this.brand,
    required this.description,
    required this.rating,
    required this.numOfReviews,
  });

  final String title, brand, description;
  final double rating;
  final int numOfReviews;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(18),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brand.toUpperCase(),
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                  size: 20,
                ),
                const SizedBox(width: 16 / 4),
                Text(
                  "$rating ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("($numOfReviews Reviews)")
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Détails sur l'article",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: const TextStyle(
                height: 1.4,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16 / 2),
          ],
        ),
      ),
    );
  }
}
