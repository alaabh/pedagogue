import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/staff_controller.dart';
import 'package:pedagogue/feature/home/drawer/staff/staff_widget.dart';
import 'package:pedagogue/model/staff.dart';

import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class StaffListView extends StatefulWidget {
  const StaffListView({super.key});

  @override
  State<StaffListView> createState() => _StaffListViewState();
}

class _StaffListViewState extends State<StaffListView> {
  StaffController staffController = StaffController();

  Future<void> loadData() async => await staffController.getAll();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.itemList(intl.staff))),
      body: Obx(
        () => ApiViewHandler.modelListBuilder(
          context,
          apiResponse: staffController.apiResponse,
          builder: (staffList) => ListView.builder(
            itemCount: StaffType.values.length,
            itemBuilder: (context, index) => StaffWidget(
              staff: staffList.firstWhereOrNull(
                (e) => e.staffType == StaffType.values[index],
              ),
              loadDataFunction: loadData,
              staffType: StaffType.values[index],
            ),
          ),
        ),
      ),
    );
  }
}
