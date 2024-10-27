import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/season_controller.dart';
import 'package:pedagogue/feature/home/drawer/season/season_widget.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../l10n/localization.dart';

class SeasonListView extends StatefulWidget {
  const SeasonListView({super.key});

  @override
  State<SeasonListView> createState() => _SeasonListViewState();
}

class _SeasonListViewState extends State<SeasonListView> {
  SeasonController seasonController = SeasonController();

  Future<void> loadData() async {
    await seasonController.getAll();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.itemList(intl.season))),
      body: Obx(
        () => ApiViewHandler.modelListBuilder(
          context,
          apiResponse: seasonController.apiResponse,
          builder: (seasonList) => ListView.builder(
            itemCount: seasonList.length,
            itemBuilder: (context, index) => SeasonWidget(
              season: seasonList[index],
              loadDataFunction: loadData,
            ),
          ),
        ),
      ),
    );
  }
}
