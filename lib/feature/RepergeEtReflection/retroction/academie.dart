import 'package:flutter/material.dart';
import '../../../l10n/localization.dart';
import '../../../shared/widget/customTextField.dart';

class academieRetroction extends StatefulWidget {
  const academieRetroction({super.key});

  @override
  State<academieRetroction> createState() => _academieRetroctionState();
}

class _academieRetroctionState extends State<academieRetroction> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('NOM'),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          const SizedBox(height: 20),
          Text('date'),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          const SizedBox(height: 20),
          Text('tranche d age '),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          const SizedBox(height: 20),
          Text('objectif '),
          Text('1'),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          const SizedBox(height: 20),
          Text('2'),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          Text('3'),
          CustomTextField(
            hintText: ' ',
            labelText: intl.numeroMaillot,
            controller: null,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
