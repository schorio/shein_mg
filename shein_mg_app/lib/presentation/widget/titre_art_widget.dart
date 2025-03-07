import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class TitreArtWidget extends StatelessWidget {
  const TitreArtWidget({
    super.key,
    required this.article,
    required this.couleur,
    this.selected = 0,
  });

  final Article article;
  final Color couleur;
  final int selected;

  @override
  Widget build(BuildContext context) {
    String title = article.titreArt;
    if (title.length > 10) {
      title =
          '${title.substring(0, 11)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    color: couleur,
                    fontFamily: 'MontSerrat_2',
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.star, color: couleur, size: 15),
                    const SizedBox(width: 5),
                    Text(
                      article.noteArt.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: MesCouleurs.noir,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
