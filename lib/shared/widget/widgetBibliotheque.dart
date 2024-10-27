import 'package:flutter/material.dart';

class CustomCardBibliotheque extends StatelessWidget {
  final String imagePath;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap; // Ajouter un callback pour gérer le tap

  CustomCardBibliotheque({
    required this.imagePath,
    required this.text,
    this.textStyle,
    this.onTap, // Permettre de passer une fonction à exécuter sur tap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Utiliser le callback onTap ici
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.9),
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
