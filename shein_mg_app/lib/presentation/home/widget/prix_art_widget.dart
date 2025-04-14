import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/home/widget/card_slider_widget.dart';

class PrixArtWidget extends StatelessWidget {
  const PrixArtWidget({
    Key? key,
    required this.article,
    required this.widget,
  }) : super(key: key);

  final Article article;
  final CardSliderWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("à partir de",
              style: TextStyle(
                fontSize: 12,
              )),
          Text("${formatNombre(article.prixArt)} Ar",
              style: TextStyle(
                fontSize: 22,
                color: widget.color,
                fontFamily: 'Montserrat_2',
              )),
        ],
      ),
    );
  }
}
