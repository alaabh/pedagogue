import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';

class TrainingCalcul extends StatefulWidget {
  const TrainingCalcul({super.key});

  @override
  State<TrainingCalcul> createState() => _TrainingCalculState();
}

class _TrainingCalculState extends State<TrainingCalcul> {
  List<Map<String, dynamic>> blocks = [
    {
      'maximum': 0,
      'veryDifficult': 0,
      'difficult': 0,
      'quiteDifficult': 0,
      'mean': 0,
      'easy': 0,
      'total': 0,
    }
  ];
  void addBlock() {
    setState(() {
      blocks.add({
        'maximum': 0,
        'veryDifficult': 0,
        'difficult': 0,
        'quiteDifficult': 0,
        'mean': 0,
        'easy': 0,
        'total': 0,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < 14; i++) {
      addBlock();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.training),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                child: GridView.count(
                  crossAxisCount: 1,

                  childAspectRatio: 1.5, // Adjust based on your needs
                  children: List.generate(
                    blocks.length,
                    (index1) => Stack(
                      children: [
                        Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                top: 10), // Make space for the title
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.maximum,
                                              label: Text(intl.maximum)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]['maximum'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]['maximum'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.veryDifficult,
                                              label: Text(intl.veryDifficult)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]
                                                    ['veryDifficult'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]
                                                        ['veryDifficult'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.difficult,
                                              label: Text(intl.difficult)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]['difficult'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]['difficult'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.quiteDifficult,
                                              label: Text(intl.quiteDifficult)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]
                                                    ['quiteDifficult'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]
                                                        ['quiteDifficult'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.mean,
                                              label: Text(intl.mean)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]['mean'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]['mean'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: intl.easy,
                                              label: Text(intl.easy)),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                blocks[index1]['easy'] = 0;
                                              }
                                              if (value.isNotEmpty) {
                                                blocks[index1]['easy'] =
                                                    int.parse(value);
                                              }
                                            });
                                          },
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            blocks[index1]['total'] =
                                                blocks[index1]['maximum'] * 64 +
                                                    blocks[index1]
                                                            ['veryDifficult'] *
                                                        48 +
                                                    blocks[index1]
                                                            ['difficult'] *
                                                        32 +
                                                    blocks[index1]
                                                            ['quiteDifficult'] *
                                                        16 +
                                                    blocks[index1]['mean'] * 8 +
                                                    blocks[index1]['easy'] * 4;
                                          });
                                        },
                                        child: Text("${intl.calculate}")),
                                    Text(
                                        "${intl.total} : ${blocks[index1]['total'].toString()}"),
                                  ],
                                )
                              ],
                            ),
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
                              (index1 + 1).toString(), // Your title text here
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
