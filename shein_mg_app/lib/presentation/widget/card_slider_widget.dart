import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/widget/prix_art_widget.dart';
import 'package:shein_mg_app/presentation/widget/modele_widget.dart';
import 'package:shein_mg_app/presentation/widget/titre_art_widget.dart';

class CardSliderWidget extends StatefulWidget {
  const CardSliderWidget({
    super.key,
    required this.articles,
    required this.color,
    required this.indexTab,
    required this.generateColors,
  });

  final List<Article> articles;
  final Color color;
  final int indexTab;
  final Function(int, int) generateColors;

  @override
  State<CardSliderWidget> createState() => _CardSliderWidgetState();
}

class _CardSliderWidgetState extends State<CardSliderWidget> {
  late final PageController _articleCardPageController;
  late final PageController _articleTitlePageController;

  double _articleCardPage = 0.0;
  int _articleCardIndex = 0;
  // ignore: unused_field
  double _articleTitlePage = 0.0;

  _articleCardPagePercentListener() {
    setState(() {
      _articleCardPage = _articleCardPageController.page!;
      _articleCardIndex = _articleCardPageController.page!.round();
    });
  }

  _articleTitlePagePercentListener() {
    setState(() {
      _articleTitlePage = _articleTitlePageController.page!;
    });
  }

  @override
  void initState() {
    _articleCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_articleCardPagePercentListener);

    _articleTitlePageController = PageController()
      ..addListener(_articleTitlePagePercentListener);
    super.initState();
  }

  @override
  void dispose() {
    _articleCardPageController
      ..removeListener(_articleCardPagePercentListener)
      ..dispose();
    _articleTitlePageController
      ..removeListener(_articleTitlePagePercentListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pochette(context, widget.indexTab),
        const SizedBox(height: 25),
        title(),
      ],
    );
  }

  Expanded title() {
    return Expanded(
      child: PageView.builder(
        controller: _articleTitlePageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.articles.length,
        itemBuilder: (_, index) {
          final article = widget.articles[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitreArtWidget(article: article, couleur: widget.color),
                const SizedBox(height: 12),
                ModeleWidget(article: article, couleur: widget.color),
                const SizedBox(height: 12),
                PrixArtWidget(article: article, widget: widget),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox pochette(BuildContext context, int indexTab) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: PageView.builder(
          controller: _articleCardPageController,
          clipBehavior: Clip.none,
          itemCount: widget.articles.length,
          onPageChanged: (page) {
            _articleTitlePageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: const Interval(0.25, 1, curve: Curves.decelerate),
            );
            setState(() {
              widget.generateColors(page, indexTab);
            });
          },
          itemBuilder: (_, index) {
            final article = widget.articles[index];
            final progress = (_articleCardPage - index);
            final scale = ui.lerpDouble(1, .8, progress.abs())!;
            final isCurrentPage = index == _articleCardIndex;
            final isScrolling =
                _articleCardPageController.position.isScrollingNotifier.value;
            final isFirstPage = index == 0;

            return Transform.scale(
              alignment: Alignment.lerp(
                Alignment.topLeft,
                Alignment.center,
                -progress,
              ),
              scale: isScrolling && isFirstPage ? 1 - progress : scale,
              child: GestureDetector(
                onTap: () {},
                child: Hero(
                  tag: article.imageArt[0],
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.identity()
                      ..translate(
                        isCurrentPage ? 0.0 : -20.0,
                        isCurrentPage ? 0.0 : 60.0,
                      ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(45)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 25,
                          offset: const Offset(0, 25),
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(.2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(article.imageArt[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
