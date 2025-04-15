import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class BlocPrix extends StatelessWidget {
  const BlocPrix({
    Key? key,
    required this.article,
    required this.couleurDominant,
  }) : super(key: key);

  final Article article;
  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: couleurDominant.withOpacity(0.03),
            ),
            color: couleurDominant.withOpacity(0.08),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prixAvantPromo(),
                  prixArticle(),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row prixArticle() {
    return Row(
      children: [
        Text(
          formatNombre(article.prixArt),
          style: TextStyle(
            color: couleurDominant,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          "Ar",
          style: TextStyle(
            color: couleurDominant,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Row prixAvantPromo() {
    return Row(
      children: [
        Text(
          " ${formatNombre(article.prixArtAP)} ",
          style: const TextStyle(
            fontSize: 9,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const Text(
          "Ar",
          style: TextStyle(fontSize: 6),
        ),
      ],
    );
  }
}
