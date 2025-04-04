import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/presentation/home/widget/card_slider_widget.dart';
import 'package:shein_mg_app/presentation/home/widget/title_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController tabController;
  PaletteGenerator? paletteGenerator;
  int selected = 0;
  int indexTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
    generateColors(selected, indexTab);
    super.initState();
  }

  void generateColors(int index, int indexTab) async {
    final listTab = [listeArticles[index], listeArticles[index]];

    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(listTab[indexTab].imageArt[0]),
      size: const Size(100, 100),
      region: const Rect.fromLTRB(0, 0, 50, 50),
    );

    setState(() {});
  }

  void _handleTabSelection() {
    setState(() {
      indexTab = tabController.index;
      generateColors(selected, indexTab);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color couleurDominant = paletteGenerator != null
        ? paletteGenerator!.darkVibrantColor != null
            ? paletteGenerator!.darkVibrantColor!.color
            : MesCouleurs.noir
        : MesCouleurs.noir;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MesCouleurs.blanc,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25,
              bottom: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TitleTabBar(
                  tabController: tabController,
                  color: couleurDominant,
                  titles: const [
                    Tab(text: "Sur commande"),
                    Tab(text: "Dispo de suite"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      CardSliderWidget(
                        articles: listeArticles,
                        color: couleurDominant,
                        indexTab: indexTab,
                        generateColors: generateColors,
                      ),
                      CardSliderWidget(
                        articles: listeArticles,
                        color: couleurDominant,
                        indexTab: indexTab,
                        generateColors: generateColors,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
