import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class TailleWidget extends StatelessWidget {
  const TailleWidget({super.key, required this.article, required this.couleur});

  final Article article;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(article.tailleArt.length, (index) {
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
    );
  }
}
