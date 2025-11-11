import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;
  final VoidCallback? delProduit;

  const ProduitBox({
    super.key,
    required this.nomProduit,
    required this.selProduit,
    this.onChanged,
    this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        // Action de suppression à droite
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (delProduit != null) delProduit!();
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Supprimer',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueAccent, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nomProduit,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Checkbox(
                value: selProduit,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}