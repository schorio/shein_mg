import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({
    super.key,
    required this.indexImage,
    required this.color,
    required this.article,
  });

  final int indexImage;
  final Color color;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                fournisseur(),
                const Spacer(),
                evaluation(context),
              ],
            ),
            const SizedBox(height: 2),
            titreArticle(context),
            const SizedBox(height: 12),
            Row(
              children: [
                motif(context),
                const SizedBox(width: 10),
                taille(),
              ],
            ),
            const SizedBox(height: 16),
            details(context),
            const SizedBox(height: 16 / 2),
          ],
        ),
      ),
    );
  }

  Column details(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Desciption",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 2),
        Text(
          article.desciption,
          style: const TextStyle(
            height: 1.4,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Row taille() {
    return Row(
      children: List.generate(article.tailleArt.length, (index) {
        return Container(
          width: 32,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: MesCouleurs.secondaire.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10),
            color: MesCouleurs.secondaire.withOpacity(0.3),
          ),
          child: Center(
            child: Text(
              article.tailleArt[index],
              style: TextStyle(
                color: color,
                fontFamily: 'MontSerrat_3',
                fontSize: 12,
              ),
            ),
          ),
        );
      }),
    );
  }

  Container motif(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(16 / 2),
        ),
      ),
      child: Text(
        article.couleurArt[indexImage],
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Text titreArticle(BuildContext context) {
    return Text(
      article.titreArt,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Row evaluation(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 20,
        ),
        const SizedBox(width: 16 / 4),
        Text(
          article.noteArt.toString(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Row fournisseur() {
    return Row(
      children: [
        const Text(
          "By",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          article.fournisseur.toUpperCase(),
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
