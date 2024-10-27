import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';

class AthleticPreparation extends StatefulWidget {
  const AthleticPreparation({super.key});

  @override
  State<AthleticPreparation> createState() => _AthleticPreparationState();
}

class _AthleticPreparationState extends State<AthleticPreparation> {
  final TextEditingController _controller1 = TextEditingController(text: '0');
  final TextEditingController _controller2 = TextEditingController(text: '0');
  final TextEditingController _controller3 = TextEditingController(text: '0');
  final TextEditingController _controller4 = TextEditingController(text: '0');
  final TextEditingController _controller5 = TextEditingController(text: '0');
  double vma1 = 0;
  double vma2 = 0;
  double vma3 = 0;
  double vma4 = 0;
  double vma5 = 0;
  double dwith1 = 0;
  double dwith2 = 0;
  double dwith3 = 0;
  double dwith4 = 0;
  double dwith5 = 0;
  double dwithout1 = 0;
  double dwithout2 = 0;
  double dwithout3 = 0;
  double dwithout4 = 0;
  double dwithout5 = 0;

  void _increment(TextEditingController _controller) {
    setState(() {
      int currentValue = int.tryParse(_controller.text) ?? 0;
      currentValue++;
      _controller.text = currentValue.toString();
      if (int.parse(_controller1.text) > 21) {
        _controller1.text = "21";
      }
      if (int.parse(_controller2.text) > 9) {
        _controller2.text = "9";
      }
      if (int.parse(_controller3.text) > 99) {
        _controller1.text = "99";
      }
      if (int.parse(_controller4.text) > 149) {
        _controller3.text = "149";
      }
      if (int.parse(_controller4.text) > 59) {
        _controller4.text = "59";
      }
      vma1 = 0.1 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma2 = 0.5 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma3 =
          1 * int.parse(_controller2.text) + 0.5 * int.parse(_controller1.text);
      vma4 = 1.5 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma5 =
          2 * int.parse(_controller2.text) + 0.5 * int.parse(_controller1.text);
      dwith1 = 2.81 * int.parse(_controller1.text) +
          0.01 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith2 = 2.81 * int.parse(_controller1.text) +
          0.08 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith3 = 2.81 * int.parse(_controller1.text) +
          0.18 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith4 = 2.81 * int.parse(_controller1.text) +
          0.28 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);

      dwith5 = 2.81 * int.parse(_controller1.text) +
          0.37 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);

      dwithout1 = 3.2 * int.parse(_controller1.text) +
          0.03 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout2 = 3.2 * int.parse(_controller1.text) +
          0.13 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout3 = 3.2 * int.parse(_controller1.text) +
          0.25 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout4 = 3.2 * int.parse(_controller1.text) +
          0.38 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout5 = 3.2 * int.parse(_controller1.text) +
          0.51 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
    });
  }

  void _decrement(TextEditingController _controller) {
    setState(() {
      int currentValue = int.tryParse(_controller.text) ?? 0;
      if (currentValue > 0) {
        currentValue--;
        _controller.text = currentValue.toString();
      }
      vma1 = 0.1 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma2 = 0.5 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma3 =
          1 * int.parse(_controller2.text) + 0.5 * int.parse(_controller1.text);
      vma4 = 1.5 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller1.text);
      vma5 =
          2 * int.parse(_controller2.text) + 0.5 * int.parse(_controller1.text);
      dwith1 = 2.81 * int.parse(_controller1.text) +
          0.01 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith2 = 2.81 * int.parse(_controller1.text) +
          0.08 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith3 = 2.81 * int.parse(_controller1.text) +
          0.18 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith4 = 2.81 * int.parse(_controller1.text) +
          0.28 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwith5 = 2.81 * int.parse(_controller1.text) +
          0.37 * int.parse(_controller2.text) +
          0.5 * int.parse(_controller3.text) +
          0.01 * int.parse(_controller4.text) +
          0.11 * int.parse(_controller5.text);
      dwithout1 = 3.2 * int.parse(_controller1.text) +
          0.03 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout2 = 3.2 * int.parse(_controller1.text) +
          0.13 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout3 = 3.2 * int.parse(_controller1.text) +
          0.25 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout4 = 3.2 * int.parse(_controller1.text) +
          0.38 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
      dwithout5 = 3.2 * int.parse(_controller1.text) +
          0.51 * int.parse(_controller2.text) +
          4.54 * int.parse(_controller3.text) +
          0.13 * int.parse(_controller4.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.athleticPreparation),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Dimensions.verticalSpacingSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                intl.lASTLEVELREACHED,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              TextField(
                                controller: _controller1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrement(_controller1);
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _increment(_controller1);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                intl.dIFFERENCEBETWEENGRP,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              TextField(
                                controller: _controller2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrement(_controller2);
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _increment(_controller2);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                intl.wORKINGTIME,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              TextField(
                                controller: _controller3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrement(_controller3);
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _increment(_controller3);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${intl.iNTENSITY}(%)",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              TextField(
                                controller: _controller4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrement(_controller4);
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _increment(_controller4);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${intl.pERCENTAGE}(%)",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              TextField(
                                controller: _controller5,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrement(_controller5);
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _increment(_controller5);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 10), // Make space for the title
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          4), // Optional, for rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${intl.bearing} : ${_controller1.text}"),
                            Text(
                                "${intl.vMA} : ${vma1.toStringAsFixed(2)}  ${intl.km}/${intl.h}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              child: Text(
                                  "${intl.distanceWithout} :\n ${dwith1.toStringAsFixed(2)} ${intl.m}"),
                            ),
                            Text(
                                "${intl.distanceWith} :\n ${dwithout1.toStringAsFixed(2)} ${intl.m}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Adjust the position as needed
                    left:
                        20, // Adjust based on the container's margin and desired position
                    child: Container(
                      color: AppColors
                          .secondaryBackgroundColor, // Match the background color of the surrounding area
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${intl.group} 1", // Your title text here
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 10), // Make space for the title
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          4), // Optional, for rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${intl.bearing} : 5"),
                            Text(
                                "${intl.vMA} : ${vma2.toStringAsFixed(2)}  ${intl.km}/${intl.h}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${intl.distanceWithout} :\n ${dwith2.toStringAsFixed(2)} ${intl.m}"),
                            Text(
                                "${intl.distanceWith} :\n ${dwithout2.toStringAsFixed(2)} ${intl.m}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Adjust the position as needed
                    left:
                        20, // Adjust based on the container's margin and desired position
                    child: Container(
                      color: AppColors
                          .secondaryBackgroundColor, // Match the background color of the surrounding area
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${intl.group} 2", // Your title text here
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 10), // Make space for the title
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          4), // Optional, for rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${intl.bearing} : 5"),
                            Text(
                                "${intl.vMA} : ${vma3.toStringAsFixed(2)}  ${intl.km}/${intl.h}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${intl.distanceWithout} :\n ${dwith3.toStringAsFixed(2)} ${intl.m}"),
                            Text(
                                "${intl.distanceWith} :\n ${dwithout3.toStringAsFixed(2)} ${intl.m}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Adjust the position as needed
                    left:
                        20, // Adjust based on the container's margin and desired position
                    child: Container(
                      color: AppColors
                          .secondaryBackgroundColor, // Match the background color of the surrounding area
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${intl.group} 3", // Your title text here
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 10), // Make space for the title
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          4), // Optional, for rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${intl.bearing} : 5"),
                            Text(
                                "${intl.vMA} : ${vma4.toStringAsFixed(2)}  ${intl.km}/${intl.h}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${intl.distanceWithout} :\n ${dwith4.toStringAsFixed(2)} ${intl.m}"),
                            Text(
                                "${intl.distanceWith} :\n ${dwithout4.toStringAsFixed(2)} ${intl.m}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Adjust the position as needed
                    left:
                        20, // Adjust based on the container's margin and desired position
                    child: Container(
                      color: AppColors
                          .secondaryBackgroundColor, // Match the background color of the surrounding area
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${intl.group} 4", // Your title text here
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 10), // Make space for the title
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          4), // Optional, for rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${intl.bearing} : 5"),
                            Text(
                                "${intl.vMA} : ${vma5.toStringAsFixed(2)}  ${intl.km}/${intl.h}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${intl.distanceWithout} :\n ${dwith5.toStringAsFixed(2)} ${intl.m}"),
                            Text(
                                "${intl.distanceWith} :\n ${dwithout5.toStringAsFixed(2)} ${intl.m}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Adjust the position as needed
                    left:
                        20, // Adjust based on the container's margin and desired position
                    child: Container(
                      color: AppColors
                          .secondaryBackgroundColor, // Match the background color of the surrounding area
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${intl.group} 5", // Your title text here
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
