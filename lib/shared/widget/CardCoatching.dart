import 'package:flutter/material.dart';

import '../../feature/Coatching/ListOfCoatching.dart';

class CoatchingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CoatchingListe()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Adjust the radius as needed
        ),
        elevation: 3, // You can adjust the elevation if desired
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,

          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'Coatching',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
