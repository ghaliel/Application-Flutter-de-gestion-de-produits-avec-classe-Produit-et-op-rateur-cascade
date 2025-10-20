import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'produit.dart';
import 'add_produits.dart';
import 'produit_details.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<Produit> produits = [
    Produit.create()
      ..libelle = 'iPhone 15'
      ..description = 'Le dernier smartphone Apple avec des fonctionnalités avancées'
      ..prix = 999.99
      ..photo = 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400',
    Produit.create()
      ..libelle = 'MacBook Pro'
      ..description = 'Ordinateur portable professionnel avec processeur M3'
      ..prix = 2499.99
      ..photo = 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    Produit.create()
      ..libelle = 'AirPods Pro'
      ..description = 'Écouteurs sans fil avec réduction de bruit active'
      ..prix = 249.99
      ..photo = 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=400',
    Produit.create()
      ..libelle = 'Apple Watch'
      ..description = 'Montre connectée avec suivi de santé avancé'
      ..prix = 399.99
      ..photo = 'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=400',
  ];
  List<bool> selection = [false, false, false, false];

  void addProduit() {
    showDialog(
      context: context,
      builder: (context) => AddProduit(
        onSave: (Produit nouveauProduit) {
          setState(() {
            produits.add(nouveauProduit);
            selection.add(false);
          });
        },
      ),
    );
  }

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selection.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produits")),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => delProduit(index),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProduitDetails(produit: produits[index]),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Photo du produit
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: produits[index].photo.isNotEmpty
                              ? Image.network(
                                  produits[index].photo,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.image_not_supported,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                      ),
                      // Informations du produit
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              produits[index].libelle,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${produits[index].prix.toStringAsFixed(2)} €',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Checkbox
                      Checkbox(
                        value: selection[index],
                        activeColor: Colors.purple,
                        onChanged: (val) {
                          setState(() {
                            selection[index] = val ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: addProduit,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
