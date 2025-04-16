import 'package:flutter/material.dart';
import 'package:shein_mg_app/domain/entities/article.dart';
import 'package:shein_mg_app/domain/logic/counter_logic.dart';

class BlocPrix extends StatefulWidget {
  const BlocPrix({
    Key? key,
    required this.article,
    required this.couleurDominant,
  }) : super(key: key);

  final Article article;
  final Color couleurDominant;

  @override
  State<BlocPrix> createState() => _BlocPrixState();
}

class _BlocPrixState extends State<BlocPrix> {
  late Counter _counterArtExpiration;
  Duration _currentExpirationDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    String timerExpirationArt =
        Counter.formatDuration(_currentExpirationDuration);

    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: widget.couleurDominant.withOpacity(0.03),
            ),
            color: widget.couleurDominant.withOpacity(0.08),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prixAvantPromo(),
                  prixArticle(),
                ],
              ),
              const Spacer(),
              if (widget.article.dateFinPromo.isNotEmpty)
                _currentExpirationDuration == Duration.zero
                    ? const Text('Artice expiré')
                    : expirationArt(timerExpirationArt)
            ],
          ),
        ),
      ),
    );
  }

  Column expirationArt(timerExpirationArt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "se termine dans :",
          style: TextStyle(
            fontSize: 9,
          ),
        ),
        Text(
          timerExpirationArt,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }

  Row prixArticle() {
    return Row(
      children: [
        Text(
          formatNombre(widget.article.prixArt),
          style: TextStyle(
            color: widget.couleurDominant,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          "Ar",
          style: TextStyle(
            color: widget.couleurDominant,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Row prixAvantPromo() {
    return Row(
      children: [
        Text(
          " ${formatNombre(widget.article.prixArtAP)} ",
          style: const TextStyle(
            fontSize: 9,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const Text(
          "Ar",
          style: TextStyle(fontSize: 6),
        ),
      ],
    );
  }

  @override
  void initState() {
    if (widget.article.dateFinPromo.isNotEmpty) {
      _counterArtExpiration = Counter(
        articleCreationDate: widget.article.dateAjout,
        expirationDuration: widget.article.dateFinPromo,
        onTimeUpdated: (newDuration) => setState(
          () => _currentExpirationDuration = newDuration,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.article.dateFinPromo.isNotEmpty) {
      _counterArtExpiration.dispose();
    }
    super.dispose();
  }
}
