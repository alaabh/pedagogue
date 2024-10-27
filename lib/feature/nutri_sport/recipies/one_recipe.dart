import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../model/nutriSport_model/recipe_model.dart';
import '../../../shared/widget/loading_widget.dart';

class SingleRecipe extends StatefulWidget {
  final Recipe recipe;
  const SingleRecipe({super.key, required this.recipe});

  @override
  State<SingleRecipe> createState() => _SingleRecipeState();
}

class _SingleRecipeState extends State<SingleRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: CachedNetworkImage(
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
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nutritional Info"),
                    Divider(color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Servings Per Recipe: 4"),
                        Text("Calories: 197"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total Fat: 9 g"),
                        Text("Cholesterol: 67 mg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Dietary Fiber: 0 g"),
                        Text("Protein : 21 g"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sodium: 1641 mg"),
                        Text("Total Carbs: 9 g"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Column(
                  children: [
                    Text("Introduction"),
                    Divider(),
                    Text(widget.recipe.introduction.toString()),
                    Text(
                        "Minutes to Prepare: ${widget.recipe.prepare.toString()}"),
                    Text(
                        "Number&nbsp;of&nbsp;Servings : ${widget.recipe.servings}"),
                    Text("Ingredients"),
                    Divider(),
                    Text(widget.recipe.ingredients.toString()),
                    Text("Directions"),
                    Divider(),
                    Text(widget.recipe.directions.toString()),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
