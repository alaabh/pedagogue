import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/controller/joueur_controller.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';

class PositionsWidget extends StatefulWidget {
  final String image1;
  final List choices;
  final List input1;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  final TextEditingController joueur;

  const PositionsWidget(
      {super.key,
      required this.image1,
      required this.choices,
      required this.input1,
      required this.controller1,
      required this.controller2,
      required this.controller3,
      required this.controller4,
      required this.joueur});

  @override
  State<PositionsWidget> createState() => _PositionsWidgetState();
}

class _PositionsWidgetState extends State<PositionsWidget> {
  JoueurController joueurController = JoueurController();

  List<String>? joueurList = [];

  Future<void> loadData() async {
    await joueurController.getAll();

    setState(() {
      for (var element in joueurController.apiResponse.value.itemList) {
        print(element.best_foot_en);
        print(element.best_foot_ar);
        print(element.best_foot_fr);
        joueurList!.add("${element.firstName} ${element.lastName}");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl: widget.image1,
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl: "https://www.mobile.sportspedagogue.com/35.png",
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl:
                "https://www.mobile.sportspedagogue.com/28_${intl.imgLang}.png",
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CustomInput(
            controller: widget.joueur,
            hint: "${intl.select(intl.player)}",
            title: intl.player,
            inputType: InputType.dropdown,
            dropdownItems: joueurList,
          ),
          Dimensions.verticalSpacingExtraLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${intl.positionalResponsibilities1}"),
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                imageUrl: "https://www.mobile.sportspedagogue.com/36.png",
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
          Dimensions.verticalSpacingExtraLarge,
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: MediaQuery.sizeOf(context).width * 0.005,
                children: List.generate(
                  widget.choices.length,
                  (index) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        widget.choices[index]['title'],
                        style: TextStyle(fontSize: 10),
                      ))),
                )),
          ),
          Dimensions.verticalSpacingExtraLarge,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...widget.input1.map((item) {
                return Column(
                  children: [
                    Text(
                      item["title"],
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: item['controller'],
                      decoration: const InputDecoration(),
                      autofocus: false,
                      maxLines: null,
                      minLines: 3,
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                  ],
                );
              }).toList(),
            ],
          ),
          Dimensions.verticalSpacingExtraLarge,
          Card(
            color: AppColors.primaryColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      child: Center(
                          child: Text("${intl.positionalResponsibilities2}"))),
                ],
              ),
            ),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl: widget.image1,
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl: "https://www.mobile.sportspedagogue.com/35.png",
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.99,
            imageUrl:
                "https://www.mobile.sportspedagogue.com/28_${intl.imgLang}.png",
            imageBuilder: (context, imageProvioder) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              height: 250,
              width: 164,
              child: Center(child: LoadingWidget()),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Dimensions.verticalSpacingExtraLarge,
          TextField(
            keyboardType: TextInputType.multiline,
            controller: widget.controller1,
            decoration: const InputDecoration(),
            autofocus: false,
            maxLines: null,
            minLines: 3,
          ),
          Dimensions.verticalSpacingExtraLarge,
          Text(
            "${intl.positionalResponsibilities2}",
            style: TextStyle(
                color: AppColors.secondaryColor, fontWeight: FontWeight.bold),
          ),
          Dimensions.verticalSpacingExtraLarge,
          TextField(
            keyboardType: TextInputType.multiline,
            controller: widget.controller2,
            decoration: const InputDecoration(),
            autofocus: false,
            maxLines: null,
            minLines: 3,
          ),
          Dimensions.verticalSpacingExtraLarge,
          TextField(
            keyboardType: TextInputType.multiline,
            controller: widget.controller3,
            decoration: const InputDecoration(),
            autofocus: false,
            maxLines: null,
            minLines: 3,
          ),
          Dimensions.verticalSpacingExtraLarge,
          TextField(
            keyboardType: TextInputType.multiline,
            controller: widget.controller4,
            decoration: const InputDecoration(),
            autofocus: false,
            maxLines: null,
            minLines: 3,
          ),
        ],
      ),
    );
  }
}
