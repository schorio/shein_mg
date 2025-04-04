import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';

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
      body: Center(
        child: Text(
          article.titreArt,
        ),
      ),
    );
  }
}
