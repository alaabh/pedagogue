import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/competition_controller.dart';
import 'package:pedagogue/controller/match_controller.dart';
import 'package:pedagogue/controller/report_controller.dart';
import 'package:pedagogue/feature/home/tabs/matches/competition_add_edit_view.dart';
import 'package:pedagogue/feature/home/tabs/matches/competition_widget.dart';
import 'package:pedagogue/feature/home/tabs/matches/match_add_edit_view.dart';
import 'package:pedagogue/feature/home/tabs/matches/match_widget.dart';
import 'package:pedagogue/feature/home/tabs/matches/report_add_edit_view.dart';
import 'package:pedagogue/feature/home/tabs/matches/report_widget.dart';
import 'package:pedagogue/shared/widget/shimmer/card_shimmer_widget.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/style/dimensions.dart';

class MatchesView extends StatefulWidget {
  const MatchesView({super.key});

  @override
  State<MatchesView> createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  // API
  CompetitionController competitionController = CompetitionController();
  MatchController matchController = MatchController();
  ReportController reportController = ReportController();

  Future<void> loadData({int? param}) async {
    if (param == null || param == 1) competitionController.getAll();
    if (param == null || param == 2) matchController.getAll();
    if (param == null || param == 3) reportController.getAll();
  }

  void deleteElement({
    required int elementId,
    required int? param,
  }) async {
    switch (param) {
      case 1:
        competitionController.apiResponse.value.itemList.removeWhere(
          (e) => e.id == elementId,
        );
        competitionController.apiResponse.refresh();
        break;
      case 2:
        matchController.apiResponse.value.itemList.removeWhere(
          (e) => e.id == elementId,
        );
        matchController.apiResponse.refresh();
        break;
      case 3:
        reportController.apiResponse.value.itemList.removeWhere(
          (e) => e.id == elementId,
        );
        reportController.apiResponse.refresh();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: loadData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: Dimensions.paddingMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      intl.competitions,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 35, fontWeight: FontWeight.w200),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CompetitionAddEditView(
                          reloadDataFunction: loadData,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Dimensions.verticalSpacingSmall,
              SizedBox(
                height: 120,
                child: Obx(
                  () => ApiViewHandler.modelListBuilder(
                    context,
                    apiResponse: competitionController.apiResponse,
                    loadingWidgetBuilder: () => const CardShimmerWidget(),
                    builder: (competitionList) => ListView.builder(
                      itemCount: competitionList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CompetitionWidget(
                        competition: competitionList[index],
                        reloadDataFunction: loadData,
                        deleteElementFunction: deleteElement,
                      ),
                    ),
                  ),
                ),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      intl.matchesAndResults,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 35, fontWeight: FontWeight.w200),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MatchAddEditView(
                          reloadDataFunction: loadData,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              SizedBox(
                height: 200,
                child: Obx(
                  () => ApiViewHandler.modelListBuilder(
                    context,
                    apiResponse: matchController.apiResponse,
                    loadingWidgetBuilder: () => const CardShimmerWidget(),
                    builder: (matchList) => ListView.builder(
                      itemCount: matchList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MatchWidget(
                        match: matchList[index],
                        reloadDataFunction: loadData,
                        deleteElementFunction: deleteElement,
                      ),
                    ),
                  ),
                ),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      intl.reports,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 35, fontWeight: FontWeight.w200),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReportAddEditView(
                          reloadDataFunction: loadData,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              SizedBox(
                height: 120,
                child: Obx(
                  () => ApiViewHandler.modelListBuilder(
                    context,
                    apiResponse: reportController.apiResponse,
                    loadingWidgetBuilder: () => const CardShimmerWidget(),
                    builder: (reportList) => ListView.builder(
                      itemCount: reportList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ReportWidget(
                        report: reportList[index],
                        reloadDataFunction: loadData,
                        deleteElementFunction: deleteElement,
                      ),
                    ),
                  ),
                ),
              ),
              Dimensions.verticalSpacingMedium,
            ],
          ),
        ),
      ),
    );
  }
}
