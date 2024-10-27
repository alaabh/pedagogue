import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/allDispline/allDisplineMain.dart';
import 'package:pedagogue/feature/bibliotheque/homeBibliotheque.dart';
import 'package:pedagogue/feature/evaluationByPosition/EvaluationByPositionMain.dart';
import 'package:pedagogue/feature/nutri_sport/nutri_sport_main.dart';
import 'package:pedagogue/feature/trainingBook/trainingBookMain.dart';
import 'package:pedagogue/l10n/localization.dart';
import '../../../../shared/widget/widgetBibliotheque.dart';

class CarousselSliderWidget extends StatefulWidget {
  const CarousselSliderWidget({super.key});

  @override
  State<CarousselSliderWidget> createState() => _CarousselSliderWidgetState();
}

class _CarousselSliderWidgetState extends State<CarousselSliderWidget> {
  final List<String> titleList = [
    intl.bibliotheque,
    intl.trainingBook,
    intl.allDispline,
    intl.evaluationByPosition,
    intl.nutriSport
  ];
  final List<String> imageList = [
    'assets/bibliotheque1.png',
    'assets/trainigBook1.png',
    'assets/allDispline.png',
    'assets/evaluation.png',
    'assets/nutriSport.png',
  ];
  final List<Widget> pathList = [
    HomeBibliotheque(),
    TrainingBookMain(),
    AllDisplineMain(),
    EvaluationByPositionMAin(),
    NutriSportMain(),
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
       CarouselSlider(
       carouselController: CarouselController(),
       options: CarouselOptions(
       onPageChanged: (index, reason) {
        setState(() {
        _current = index;
          });
           },
              height: MediaQuery.of(context).size.height * 0.3,
              viewportFraction: 1,
            ),
            items: titleList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomCardBibliotheque(
                  imagePath: imageList[_current],
                  text: i,
                  onTap: () {
                    Navigator.of(context).push(
                   MaterialPageRoute(
                    builder: (context) => pathList[_current]),
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: titleList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
