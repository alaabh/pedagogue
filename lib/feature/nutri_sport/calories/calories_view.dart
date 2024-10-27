import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/nutriSport_controller/calories_controller.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/loading_widget.dart';

class CaloriesView extends StatefulWidget {
  const CaloriesView({super.key});

  @override
  State<CaloriesView> createState() => _CaloriesViewState();
}

class _CaloriesViewState extends State<CaloriesView> {
  TextEditingController _CaloriesController = TextEditingController();

  List<String>? teamList = [];
  final CaloriesController caloriesGetxController =
      Get.put(CaloriesController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.calories),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomTextField(
                  hintText: intl.calories,
                  labelText: intl.calories,
                  controller: _CaloriesController,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomButton(
              onPressed: () {
                caloriesGetxController.fetchCalories(_CaloriesController.text);
              },
              text: intl.generate,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Obx(() {
              if (caloriesGetxController.isLoading.value) {
                print("loading");
                return Center(child: CircularProgressIndicator());
              } else if (caloriesGetxController.calorie.value.nutrients ==
                  null) {
                return Container();
              } else {
                return Column(
                  children: [
                    card(
                        intl.calories,
                        "https://app.sportspedagogue.com/_nuxt/img/calories.6e87614.png",
                        caloriesGetxController.calorie.value.nutrients!.calories
                            .toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    card(
                        intl.protein,
                        "https://app.sportspedagogue.com/_nuxt/img/protein.d117bb8.png",
                        caloriesGetxController.calorie.value.nutrients!.protein
                            .toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    card(
                        intl.fat,
                        "https://app.sportspedagogue.com/_nuxt/img/fat.ff948d2.png",
                        caloriesGetxController.calorie.value.nutrients!.fat
                            .toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    card(
                        intl.carbohydrates,
                        "https://app.sportspedagogue.com/_nuxt/img/carbohydrate.71917e8.png",
                        caloriesGetxController
                            .calorie.value.nutrients!.carbohydrates
                            .toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      children: List.generate(
                          caloriesGetxController.calorie.value.meals!.length,
                          (index) => Column(
                                children: [
                                  Divider(),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    child: CachedNetworkImage(
                                      imageUrl: caloriesGetxController
                                          .calorie.value.meals![index].image
                                          .toString(),
                                      imageBuilder: (context, imageProvioder) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvioder,
                                                fit: BoxFit.fill),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                        height: 250,
                                        width: 164,
                                        child: Center(child: LoadingWidget()),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://api.spoonacular.com/recipes/${caloriesGetxController.calorie.value.meals![index].id.toString()}/nutritionWidget.png?apiKey=692e86b858d04c6697e94ef392db71f4",
                                      imageBuilder: (context, imageProvioder) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvioder,
                                                fit: BoxFit.fill),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                        height: 250,
                                        width: 164,
                                        child: Center(child: LoadingWidget()),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ],
                              )),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget card(String title, String imageUrl, String value) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                ),
                Text(title)
              ],
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Divider()),
            Text(value)
          ],
        ),
      ),
    );
  }
}
