import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    required this.article,
    required this.index,
  });

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: article.imageArt[index],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        child: Image.asset(
          article.imageArt[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
