import 'package:flutter/material.dart';
import 'produit.dart';

class AddProduit extends StatefulWidget {
  final Function(Produit) onSave;

  const AddProduit({
    super.key,
    required this.onSave,
  });

  @override
  State<AddProduit> createState() => _AddProduitState();
}

class _AddProduitState extends State<AddProduit> {
  final TextEditingController libelleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController prixController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  @override
  void dispose() {
    libelleController.dispose();
    descriptionController.dispose();
    prixController.dispose();
    photoController.dispose();
    super.dispose();
  }

  void _saveProduit() {
    if (libelleController.text.isNotEmpty && 
        descriptionController.text.isNotEmpty && 
        prixController.text.isNotEmpty) {
      
      // Utilisation de l'opérateur cascade pour créer le produit
      Produit nouveauProduit = Produit.create()
        ..libelle = libelleController.text
        ..description = descriptionController.text
        ..prix = double.tryParse(prixController.text) ?? 0.0
        ..photo = photoController.text.isNotEmpty 
            ? photoController.text 
            : 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400'; // Image par défaut
      
      widget.onSave(nouveauProduit);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs obligatoires'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter un produit"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: libelleController,
              decoration: const InputDecoration(
                labelText: "Libellé *",
                hintText: "Nom du produit",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description *",
                hintText: "Description du produit",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: prixController,
              decoration: const InputDecoration(
                labelText: "Prix *",
                hintText: "Prix en euros",
                border: OutlineInputBorder(),
                prefixText: "€ ",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: photoController,
              decoration: const InputDecoration(
                labelText: "URL Photo",
                hintText: "URL de l'image (optionnel)",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: _saveProduit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          child: const Text("Ajouter"),
        ),
      ],
    );
  }
}