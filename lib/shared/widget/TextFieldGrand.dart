import 'package:flutter/material.dart';

class TextFieldGrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,  // Définit le champ de texte pour accepter 4 lignes.
      decoration: InputDecoration(
        hintText: 'Entrez votre texte ici',
        border: OutlineInputBorder(),  // Ajoute une bordure autour du champ de texte.
      ),
    );
  }
}
