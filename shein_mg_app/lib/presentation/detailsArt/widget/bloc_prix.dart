import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
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
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: MesCouleurs.secondaire.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10),
            color: MesCouleurs.secondaire.withOpacity(0.3),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        " ${formatNombre(article.prixArtAP)} ",
                        style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Text(
                        "Ar",
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        formatNombre(article.prixArt),
                        style: TextStyle(
                          color: couleurDominant,
                          fontFamily: 'MontSerrat_2',
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "Ar",
                        style: TextStyle(
                          color: couleurDominant,
                          fontFamily: 'MontSerrat_2',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
