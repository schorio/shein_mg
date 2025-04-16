import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/article_images.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/article_info.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/bloc_prix.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/index_image.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/real_article.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/silver_app_bar.dart';

class DetailsArt extends StatefulWidget {
  const DetailsArt({super.key});

  @override
  State<DetailsArt> createState() => _DetailsArtState();
}

class _DetailsArtState extends State<DetailsArt> {
  late final article = ModalRoute.of(context)!.settings.arguments as Article;
  late PageController _imageController;
  int _currentImage = 0;
  PaletteGenerator? paletteGenerator;

  @override
  Widget build(BuildContext context) {
    Color couleurDominant = paletteGenerator != null
        ? paletteGenerator!.vibrantColor != null
            ? paletteGenerator!.vibrantColor!.color
            : Colors.black
        : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SilverAppBar(),
            imageSlider(),
            BlocPrix(
              article: article,
              couleurDominant: couleurDominant,
            ),
            ArticleInfo(
              indexImage: _currentImage,
              color: couleurDominant,
              article: article,
            ),
            RealArticle(article: article),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter imageSlider() {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 0.9,
        child: Stack(
          children: [
            PageView.builder(
              controller: _imageController,
              onPageChanged: (pageNum) {
                setState(() {
                  _currentImage = pageNum;
                  generateColors(article.imageArt[_currentImage]);
                });
              },
              itemCount: article.imageArt.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ArticleImage(
                  article: article,
                  index: index,
                ),
              ),
            ),
            if (article.imageArt.length > 1)
              IndexImage(
                article: article,
                index: _currentImage,
              )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    generateColors(article.imageArt[_currentImage]);
    _imageController =
        PageController(viewportFraction: 0.9, initialPage: _currentImage);
    super.didChangeDependencies();
  }

  void generateColors(image) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
      size: const Size(100, 100),
      region: const Rect.fromLTRB(0, 0, 50, 50),
    );

    setState(() {});
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }
}
