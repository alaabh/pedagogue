import 'package:flutter/material.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 4, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Card(
            elevation: 4.0, // Card elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Rounded corners for the card
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
