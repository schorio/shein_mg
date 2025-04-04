import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/article_images.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/article_info.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/index_image.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SilverAppBar(),
            imageSlider(),
            ArticleInfo(
              brand: "LIPSY LONDON",
              title: "Sleeveless Ruffle",
              description:
                  "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
              rating: 4.4,
              numOfReviews: 126,
            ),
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
  void initState() {
    _imageController =
        PageController(viewportFraction: 0.9, initialPage: _currentImage);
    super.initState();
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }
}
