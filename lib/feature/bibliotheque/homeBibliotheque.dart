import 'package:flutter/material.dart';
import 'package:pedagogue/feature/bibliotheque/pdf/homePdf.dart';
import 'package:pedagogue/l10n/localization.dart';
import '../../model/CridItemBibliotheque.dart'; // Make sure this path is correct
import 'EpsVideo/EPsVideoHome.dart';
import 'FormationVideo/FormationVideoHome.dart';

class HomeBibliotheque extends StatefulWidget {
  @override
  _HomeBibliothequeState createState() => _HomeBibliothequeState();
}

class _HomeBibliothequeState extends State<HomeBibliotheque> {
  List<GridItem> items = <GridItem>[];
// This closing bracket was missing
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = [
      GridItem(
        title: intl.pdf,
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HomePdf())),
      ),
      GridItem(
        title: intl.formationVideos,
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FormationVideoHome())),
      ),
      GridItem(
        title: intl.epsVideos,
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => EpsVideoHome())),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.bibliotheque),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: items[index].onTap,
            child: Card(
              child: Center(
                child: Text(items[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
