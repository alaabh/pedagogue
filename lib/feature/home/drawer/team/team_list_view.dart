import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/team_controller.dart';
import 'package:pedagogue/feature/home/drawer/team/team_widget.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../l10n/localization.dart';

class TeamListView extends StatefulWidget {
  const TeamListView({super.key});

  @override
  State<TeamListView> createState() => _TeamListViewState();
}

class _TeamListViewState extends State<TeamListView> {
  TeamController teamController = TeamController();

  Future<void> loadData() async {
    await teamController.getAll();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.itemList(intl.team))),
      body: Obx(
        () => ApiViewHandler.modelListBuilder(
          context,
          apiResponse: teamController.apiResponse,
          builder: (teamList) => ListView.builder(
            itemCount: teamList.length,
            itemBuilder: (context, index) => TeamWidget(
              team: teamList[index],
              loadDataFunction: loadData,
            ),
          ),
        ),
      ),
    );
  }
}
