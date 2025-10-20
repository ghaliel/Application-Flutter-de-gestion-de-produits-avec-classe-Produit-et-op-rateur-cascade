# 📱 ProduitsApp - Application Flutter de Gestion de Produits

Une application Flutter moderne pour la gestion et l'affichage de produits avec photos, descriptions et prix.

## ✨ Fonctionnalités

- 📋 **Liste des produits** avec photos et informations
- ➕ **Ajout de nouveaux produits** avec formulaire complet
- 🔍 **Détails des produits** avec navigation intuitive
- 🖼️ **Affichage des photos** avec gestion d'erreurs
- 🎨 **Interface moderne** avec Material Design
- ✅ **Sélection multiple** avec checkboxes
- 🗑️ **Suppression** avec glissement (swipe)

## 🏗️ Architecture

### Classes principales

#### `Produit` - Modèle de données
```dart
class Produit {
  String libelle;
  String description;
  double prix;
  String photo;
  
  // Utilisation de l'opérateur cascade pour le builder pattern
  Produit.create()
    ..libelle = 'Nom du produit'
    ..description = 'Description...'
    ..prix = 99.99
    ..photo = 'https://...';
}
```

#### `ProduitsList` - Liste principale
- Affichage des produits avec photos
- Navigation vers les détails
- Ajout/suppression de produits

#### `ProduitDetails` - Page de détails
- Affichage complet des informations
- Interface élégante avec dégradés

#### `AddProduit` - Formulaire d'ajout
- Saisie de tous les champs du produit
- Validation des données
- Utilisation de l'opérateur cascade

## 🚀 Installation et Lancement

### Prérequis
- Flutter SDK (version 3.0+)
- Dart SDK
- Android Studio / VS Code
- Émulateur Android ou appareil physique

### Étapes d'installation

1. **Cloner le repository**
```bash
git clone https://github.com/votre-username/produitsapp.git
cd produitsapp
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Lancer l'application**
```bash
flutter run
```

## 📱 Captures d'écran

### Liste des produits
- Affichage des produits avec photos
- Prix en couleur verte
- Interface moderne avec cartes

### Détails du produit
- Photo en grand format
- Informations complètes
- Design élégant avec dégradés

### Formulaire d'ajout
- Champs pour tous les attributs
- Validation des données
- Interface intuitive

## 🛠️ Technologies utilisées

- **Flutter** - Framework de développement mobile
- **Dart** - Langage de programmation
- **Material Design** - Système de design
- **flutter_slidable** - Widget pour les actions de glissement
- **Opérateur cascade** - Pattern builder pour la création d'objets

## 📂 Structure du projet

```
lib/
├── main.dart              # Point d'entrée de l'application
├── produit.dart           # Classe modèle Produit
├── produits_list.dart     # Liste principale des produits
├── produit_details.dart   # Page de détails d'un produit
├── add_produits.dart      # Formulaire d'ajout de produit
└── produit_box.dart       # Widget réutilisable (legacy)
```

## 🎯 Fonctionnalités techniques

### Opérateur Cascade
L'application utilise l'opérateur cascade (`..`) de Dart pour créer des objets de manière fluide :

```dart
Produit nouveauProduit = Produit.create()
  ..libelle = 'iPhone 15'
  ..description = 'Le dernier smartphone Apple'
  ..prix = 999.99
  ..photo = 'https://example.com/photo.jpg';
```

### Gestion des images
- Chargement d'images depuis des URLs
- Gestion des erreurs avec icônes de fallback
- Images par défaut si aucune URL n'est fournie

### Navigation
- Navigation fluide entre les écrans
- Retour intuitif avec bouton de navigation
- Passage de données entre les pages

## 🔧 Personnalisation

### Modifier le thème
Le thème peut être personnalisé dans `main.dart` :
```dart
theme: ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: const Color(0xFFFBEAFF),
),
```

### Ajouter de nouveaux champs
Pour ajouter de nouveaux champs au produit :
1. Modifier la classe `Produit`
2. Mettre à jour le formulaire `AddProduit`
3. Afficher les nouveaux champs dans `ProduitDetails`

## 📝 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👨‍💻 Développeur

Développé avec ❤️ en Flutter/Dart

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
- Ouvrir une issue pour signaler un bug
- Proposer de nouvelles fonctionnalités
- Soumettre une pull request

## 📞 Support

Pour toute question ou problème, n'hésitez pas à ouvrir une issue sur GitHub.

---

**Version:** 1.0.0  
**Dernière mise à jour:** Décembre 2024