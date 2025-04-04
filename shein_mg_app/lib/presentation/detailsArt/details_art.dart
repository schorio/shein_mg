import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/article_images.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/silver_app_bar.dart';

class DetailsArt extends StatefulWidget {
  const DetailsArt({super.key});

  @override
  State<DetailsArt> createState() => _DetailsArtState();
}

class _DetailsArtState extends State<DetailsArt> {
  late final article = ModalRoute.of(context)!.settings.arguments as Article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SilverAppBar(),
            ArticleImage(
              images: article.imageArt,
            ),
          ],
        ),
      ),
    );
  }
}
