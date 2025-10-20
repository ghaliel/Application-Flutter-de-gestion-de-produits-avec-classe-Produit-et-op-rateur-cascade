class Produit {
  String libelle;
  String description;
  double prix;
  String photo;

  Produit({
    required this.libelle,
    required this.description,
    required this.prix,
    required this.photo,
  });

  // Constructeur avec opérateur cascade pour le builder pattern
  Produit.empty()
      : libelle = '',
        description = '',
        prix = 0.0,
        photo = '';

  @override
  String toString() {
    return '$libelle - ${prix.toStringAsFixed(2)}€';
  }

  // Méthode pour créer un produit avec l'opérateur cascade
  static Produit create() {
    return Produit.empty();
  }
}
