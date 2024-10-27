import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../model/nutriSport_model/recipe_model.dart';
import '../../../shared/widget/loading_widget.dart';

class RecipesCardWidget extends StatefulWidget {
  final Recipe recipe;

  const RecipesCardWidget({super.key, required this.recipe});

  @override
  State<RecipesCardWidget> createState() => _RecipesCardWidgetState();
}

class _RecipesCardWidgetState extends State<RecipesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.4,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Column(
          children: [
            Text(widget.recipe.name),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Stack(alignment: Alignment.topRight, children: [
                      CachedNetworkImage(
                        imageUrl: widget.recipe.image,
                        imageBuilder: (context, imageProvioder) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvioder, fit: BoxFit.fill),
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
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.08,
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(intl.cals),
                                  Text(widget.recipe.calories.toString())
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.08,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(intl.time),
                                  Text(widget.recipe.time.toString())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(intl.fat),
                            Text("${widget.recipe.fat}g"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(intl.protein),
                            Text("${widget.recipe.protein}g"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(intl.carbohydrates),
                            Text("${widget.recipe.carbs}g"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(intl.fiber),
                            Text("${widget.recipe.fiber}g"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
