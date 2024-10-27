import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';

class MultiCheckBoxReportWidget extends StatefulWidget {
  final List<Map<String, dynamic>> blocks;
  final void Function(int index) deleteBlock;
  final int gridViewAxisCount;
  final double gridchildAspectRatiot;
  const MultiCheckBoxReportWidget(
      {super.key,
      required this.blocks,
      required this.deleteBlock,
      required this.gridViewAxisCount,
      required this.gridchildAspectRatiot});

  @override
  State<MultiCheckBoxReportWidget> createState() =>
      _MultiCheckBoxReportWidgetState();
}

class _MultiCheckBoxReportWidgetState extends State<MultiCheckBoxReportWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.blocks.length, (index) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Column(
                        children: [
                          TextField(
                            // Use widget.controller instead of _controller
                            decoration: InputDecoration(
                              hintText: intl.trainingProgram,
                              labelText: intl.trainingProgram,
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                widget.blocks[index]
                                    ["traningProgramController"] = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: GridView.count(
                              crossAxisCount: widget.gridViewAxisCount,

                              childAspectRatio: widget
                                  .gridchildAspectRatiot, // Adjust based on your needs
                              children: List.generate(
                                widget.blocks[0]["weekCheckBox"].length,
                                (index1) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: widget.blocks[index]
                                              ["weekCheckBox"][
                                          widget.blocks[0]["weekCheckBox"].keys
                                              .elementAt(
                                                  index1)], // Update this based on your state management
                                      onChanged: (bool? value) {
                                        setState(() {
                                          widget.blocks[index]["weekCheckBox"][
                                              widget.blocks[0]["weekCheckBox"]
                                                  .keys
                                                  .elementAt(index1)] = value;
                                        });

                                        // Handle change
                                      },
                                    ),
                                    Text(
                                      // Assuming you want to display some text below the checkbox
                                      widget.blocks[0]["weekCheckBox"].keys
                                          .elementAt(index1),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                widget.deleteBlock(index);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
