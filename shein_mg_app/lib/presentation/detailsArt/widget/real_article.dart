import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

class RealArticle extends StatefulWidget {
  const RealArticle({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<RealArticle> createState() => _RealArticleState();
}

class _RealArticleState extends State<RealArticle> {
  int showedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          child: Text(
            "Photo réel",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              CarouselSlider.builder(
                itemCount: widget.article.imageArt.length,
                options: CarouselOptions(
                  initialPage: showedIndex,
                  viewportFraction: MediaQuery.of(context).size.width / 380,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      showedIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                            widget.article.imageArt[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 150,
                        ),
                        child: Row(
                          children: List.generate(
                            widget.article.imageArt.length,
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
                                  color: showedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
