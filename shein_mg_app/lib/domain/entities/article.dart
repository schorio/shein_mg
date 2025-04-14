class Article {
  final int idArt;
  final String fournisseur;
  final String titreArt;
  final double prixArt;
  final double noteArt;
  final List<String> imageArt;
  final List<String> couleurArt;
  final List<String> tailleArt;
  final List<String> comsArt;

  Article({
    required this.idArt,
    required this.fournisseur,
    required this.titreArt,
    required this.prixArt,
    required this.noteArt,
    required this.imageArt,
    required this.couleurArt,
    required this.tailleArt,
    required this.comsArt,
  });
}

List<Article> listeArticles = [
  Article(
    idArt: 1,
    fournisseur: 'shein',
    titreArt: 'Article 1',
    prixArt: 45000.00,
    noteArt: 4.5,
    imageArt: [
      'lib/core/assets/1-1.webp',
      'lib/core/assets/1-2.webp',
      'lib/core/assets/1-3.webp',
      'lib/core/assets/1-4.webp',
    ],
    couleurArt: ['Green', 'Yellow', 'Red', 'Blue'],
    tailleArt: ['M', 'L', 'XL'],
    comsArt: ['Good quality', 'Worth the price'],
  ),
  Article(
    idArt: 2,
    fournisseur: 'shein',
    titreArt: 'Article 2',
    prixArt: 60000.00,
    noteArt: 4.0,
    imageArt: [
      'lib/core/assets/2-1.webp',
      'lib/core/assets/2-2.webp',
      'lib/core/assets/2-3.webp',
    ],
    couleurArt: ['Black', 'White', 'Gray'],
    tailleArt: ['S', 'M', 'L'],
    comsArt: ['Great product!', 'Loved it!'],
  ),
  Article(
    idArt: 3,
    fournisseur: 'shein',
    titreArt: 'Robe Élégante',
    prixArt: 38000.00,
    noteArt: 4.2,
    imageArt: [
      'lib/core/assets/3-1.webp',
      'lib/core/assets/3-2.webp',
      'lib/core/assets/3-3.webp',
      'lib/core/assets/3-4.webp',
      'lib/core/assets/3-5.webp',
    ],
    couleurArt: ['Blue', 'Green', 'Yellow', 'Orange', 'Red'],
    tailleArt: ['S', 'M', 'L', 'XL'],
    comsArt: ['Nice fabric', 'Very comfortable'],
  ),
  Article(
    idArt: 4,
    fournisseur: 'shein',
    titreArt: 'Robe de Soirée',
    prixArt: 59000.00,
    noteArt: 4.8,
    imageArt: [
      'lib/core/assets/4-1.webp',
      'lib/core/assets/4-2.webp',
      'lib/core/assets/4-3.webp',
    ],
    couleurArt: ['Red', 'Black', 'White'],
    tailleArt: ['M', 'L', 'XL'],
    comsArt: ['Excellent quality', 'Highly recommend'],
  ),
  Article(
    idArt: 5,
    fournisseur: 'shein',
    titreArt: 'Robe Décontractée',
    prixArt: 55000.00,
    noteArt: 3.9,
    imageArt: [
      'lib/core/assets/5-1.webp',
      'lib/core/assets/5-2.webp',
      'lib/core/assets/5-3.webp',
      'lib/core/assets/5-4.webp',
    ],
    couleurArt: ['Pink', 'Purple', 'Blue', 'Green'],
    tailleArt: ['S', 'M'],
    comsArt: ['Good value', 'Nice design'],
  ),
  // Add more articles as needed
];
