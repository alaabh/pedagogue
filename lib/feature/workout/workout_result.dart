import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../shared/style/dimensions.dart';
import '../../shared/widget/loading_widget.dart';

class WorkoutResult extends StatefulWidget {
  final String result;
  final List<String> imgUrls;
  const WorkoutResult({super.key, required this.result, required this.imgUrls});

  @override
  State<WorkoutResult> createState() => _WorkoutResultState();
}

class _WorkoutResultState extends State<WorkoutResult> {
  @override
  void initState() {
    print(widget.imgUrls);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout Result",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Column(
                children: [
                  Text(
                    widget.result,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: widget.imgUrls
                        .map(
                          (item) => Column(
                            children: [
                              Dimensions.verticalSpacingExtraLarge,
                              CachedNetworkImage(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 0.9,
                                imageUrl: item,
                                imageBuilder: (context, imageProvioder) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvioder,
                                          fit: BoxFit.fill),
                                    ),
                                  );
                                },
                                placeholder: (context, url) => const SizedBox(
                                  height: 250,
                                  width: 164,
                                  child: Center(child: LoadingWidget()),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
