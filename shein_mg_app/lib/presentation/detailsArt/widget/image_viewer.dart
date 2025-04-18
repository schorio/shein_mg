import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late Article article;
  late int showedIndex;

  final transController = TransformationController();
  TapDownDetails? doubleTapDetails;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: article.imageArt.length,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.75,
        initialPage: showedIndex,
        viewportFraction: MediaQuery.of(context).size.width / 380,
        onPageChanged: (index, reason) {
          setState(() {
            showedIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, _) {
        return GestureDetector(
          onDoubleTap: handleDoubleTap,
          onDoubleTapDown: handleDoubleTapDown,
          child: InteractiveViewer(
            transformationController: transController,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    article.imageArt[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    article = arguments['article'];
    showedIndex = arguments['showedIndex'];
    super.didChangeDependencies();
  }

  handleDoubleTapDown(TapDownDetails details) {
    doubleTapDetails = details;
  }

  handleDoubleTap() {
    if (transController.value != Matrix4.identity()) {
      transController.value = Matrix4.identity();
    } else {
      final position = doubleTapDetails!.localPosition;
      transController.value = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);
    }
  }
}
