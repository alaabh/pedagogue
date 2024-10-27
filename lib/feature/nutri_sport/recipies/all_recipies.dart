import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/nutri_sport/recipies/one_recipe.dart';
import 'package:pedagogue/feature/nutri_sport/recipies/recipies_card_widget.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../controller/nutriSport_controller/recipe_controller.dart';

class AllRecipes extends StatefulWidget {
  const AllRecipes({super.key});

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  Map<String, bool> type = {
    intl.beef: false,
    intl.fish: false,
    intl.vegetarian: false,
    intl.snacks: false,
    intl.poultry: false,
    intl.dessert: false,
    intl.appetizers: false,
    intl.sides: false,
    intl.choose: false,
  };

  @override
  void initState() {
    super.initState();
    // RecipeController().fetchRecipes('Poultry');
    type = {
      intl.beef: false,
      intl.fish: false,
      intl.vegetarian: false,
      intl.snacks: false,
      intl.poultry: false,
      intl.dessert: false,
      intl.appetizers: false,
      intl.sides: false,
      intl.choose: false,
    };
  }

  final RecipeController recipeController = Get.put(RecipeController());
  String? _character = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.recipes),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Text(intl.recipeType),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GridView.count(
                      crossAxisCount: 5,

                      childAspectRatio: MediaQuery.of(context).size.width *
                          0.0020, // Adjust based on your needs
                      children: List.generate(
                        type.length,
                        (index1) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<String?>(
                              value: type.keys.elementAt(index1),
                              groupValue: _character,
                              onChanged: (String? value) {
                                setState(() {
                                  _character = value;
                                  recipeController.fetchRecipes(_character!);
                                  print(_character);
                                });
                              },
                            ),
                            Text(
                              // Assuming you want to display some text below the checkbox
                              type.keys.elementAt(index1),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (recipeController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                //print(recipeController.recipesList[0].id);
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.64,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SingleRecipe(
                                  recipe: recipeController.recipesList[index]),
                            ),
                          );
                        },
                        child: RecipesCardWidget(
                          recipe: recipeController.recipesList[index],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: recipeController.recipesList.length,
                  ),
                );
                /* ListView.builder(
                      itemCount: recipeController.recipesList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(recipeController.recipesList[index].name),
                          // Add more details as needed
                        );
                      }); */
              }
            }),
          ],
        ),
      ),
    );
  }
}
