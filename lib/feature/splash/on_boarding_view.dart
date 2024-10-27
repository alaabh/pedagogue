import 'package:flutter/material.dart';
import 'package:pedagogue/feature/splash/features_pedagogue/features_peagogue1.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';
import '../../shared/widget/custom_button.dart';
import 'features_pedagogue/features_pedagogue2.dart';
import 'features_pedagogue/features_pedagogue3.dart';
import 'features_pedagogue/features_pedagogue4.dart';
import 'features_pedagogue/features_pedagogue5.dart';
import 'features_pedagogue/features_pedagogue6.dart';
import 'features_pedagogue/features_pedagogue7.dart';
import 'features_pedagogue/features_pedagogue8.dart';
import 'features_pedagogue/features_pedagogur9.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                  children: [
                   Features1(),
                    Features2(),
                    Features3(),
                    Features4(),
                   Features5(),
                    Features6(),
                    Features7(),
                    Features8(),
                    Features9(),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(9, (index) => _buildDot(index, context)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                text: intl.next,
                onPressed: () {
                  try {
                    Navigator.pushNamed(context, '/loginScreen');
                  } catch (e) {
                    print('Navigation error: $e');
                  }
                },
                // You can also override the default width and height if needed
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? AppColors.primaryColor
            : AppColors.accentColor,
      ),
    );
  }


}
