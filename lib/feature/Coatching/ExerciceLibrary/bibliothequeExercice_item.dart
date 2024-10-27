import 'package:flutter/material.dart';
import '../../../controller/BibliothequeExercice_controller.dart';
import '../../../model/exerciceLibrery.dart';
import '../../../shared/style/dimensions.dart';
import 'single_exercice.dart';

class bibliothequeExerciceWidgett extends StatelessWidget {
  final BibliothequeExercicee? bibliothequeExercicee;
  final Function() loadDataFunction;

  const bibliothequeExerciceWidgett({
    Key? key,
    required this.loadDataFunction,
    this.bibliothequeExercicee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BibliothequeExerciceController bibliothequeExerciceController =
        BibliothequeExerciceController();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SingleExercice(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: Dimensions.mediumValue,
          horizontal: Dimensions.largeValue,
        ),
        child: Padding(
          padding: Dimensions.paddingLarge,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${bibliothequeExercicee?.name ?? ''}',
                      style: Theme.of(context).textTheme.titleLarge!,
                    ),
                    Text('${bibliothequeExercicee?.rating ?? ''}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
