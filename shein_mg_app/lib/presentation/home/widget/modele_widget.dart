import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class ModeleWidget extends StatelessWidget {
  const ModeleWidget({super.key, required this.article, required this.couleur});

  final Article article;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          afficheCouleur(),
          const SizedBox(width: 5),
          afficheTaille(),
        ],
      ),
    );
  }

  Row afficheTaille() {
    return Row(
      children: [
        Text(
          article.tailleArt.length.toString(),
          style: TextStyle(
            color: couleur,
            fontFamily: 'MontSerrat_2',
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 5),
        const Text("tailles : "),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              article.tailleArt.length > 3 ? 3 : article.tailleArt.length,
              (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MesCouleurs.secondaire.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(12),
                color: MesCouleurs.secondaire.withOpacity(0.3),
              ),
              child: Text(
                article.tailleArt[index],
                style: TextStyle(
                  color: couleur,
                  fontFamily: 'MontSerrat_3',
                  fontSize: 12,
                ),
              ),
            );
          }),
        ),
        if (article.tailleArt.length > 3) const Text("...")
      ],
    );
  }

  Container afficheCouleur() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: MesCouleurs.secondaire.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
        color: MesCouleurs.secondaire.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Text(
            article.couleurArt.length.toString(),
            style: TextStyle(
              color: couleur,
              fontFamily: 'MontSerrat_2',
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text("couleurs")
        ],
      ),
    );
  }
}
