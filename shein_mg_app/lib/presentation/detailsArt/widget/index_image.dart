import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class IndexImage extends StatelessWidget {
  const IndexImage({
    super.key,
    required this.article,
    required this.index,
    required this.height,
    required this.bottom,
    required this.right,
  });

  final Article article;
  final int index;
  final double height, bottom, right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: height,
      bottom: MediaQuery.of(context).size.width * bottom,
      right: MediaQuery.of(context).size.width * right,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          children: List.generate(
            article.imageArt.length,
            (i) => Padding(
              padding: EdgeInsets.only(
                  right: i == (article.imageArt.length - 1) ? 0 : 4),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(i == index ? 1 : 0.2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
