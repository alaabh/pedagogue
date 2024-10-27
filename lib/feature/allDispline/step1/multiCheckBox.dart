import 'package:flutter/material.dart';
import '../../../shared/style/app_color.dart';

class MulticheckBoxWidget extends StatefulWidget {
  final List<Map<String, dynamic>> blocks;

  final int gridViewAxisCount;
  const MulticheckBoxWidget(
      {super.key, required this.blocks, required this.gridViewAxisCount});

  @override
  State<MulticheckBoxWidget> createState() => _MulticheckBoxWidgetState();
}

class _MulticheckBoxWidgetState extends State<MulticheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor)),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: GridView.count(
                            shrinkWrap: false,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: widget.gridViewAxisCount,

                            childAspectRatio: 1, // Adjust based on your needs
                            children: List.generate(
                              widget.blocks[0]["weekCheckBox"].length,
                              (index1) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: widget.blocks[index]["weekCheckBox"][
                                        widget.blocks[0]["weekCheckBox"].keys
                                            .elementAt(
                                                index1)], // Update this based on your state management
                                    onChanged: (bool? value) {
                                      setState(() {
                                        widget.blocks[index]["weekCheckBox"][
                                            widget
                                                .blocks[0]["weekCheckBox"].keys
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
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Positioned(
              top: 0, // Adjust the position as needed
              left:
                  20, // Adjust based on the container's margin and desired position
              child: Container(
                color: Colors
                    .white, // Match the background color of the surrounding area
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Return To Calm', // Your title text here
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
