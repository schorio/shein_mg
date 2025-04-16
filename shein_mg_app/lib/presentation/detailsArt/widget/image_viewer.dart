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

  @override
  void didChangeDependencies() {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    article = arguments['article'];
    showedIndex = arguments['showedIndex'];
    super.didChangeDependencies();
  }

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
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                article.imageArt[index],
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 150,
            ),
            child: Row(
              children: List.generate(
                article.imageArt.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: showedIndex == index ? 20 : 8,
                    height: showedIndex == index ? 10 : 8,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: showedIndex == index ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
