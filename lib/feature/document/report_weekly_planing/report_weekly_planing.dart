/* import 'package:flutter/material.dart';

class ReportWeeklyPlaning extends StatefulWidget {
  const ReportWeeklyPlaning({super.key});

  @override
  State<ReportWeeklyPlaning> createState() => _ReportWeeklyPlaningState();
}

class _ReportWeeklyPlaningState extends State<ReportWeeklyPlaning> {
  final MiddleController middleController = MiddleController();
  Future<void> loadData() async {
    final result = await middleController.getAll();
    print(middleController.apiResponse.value.item); // Print the result

    final data = middleController.apiResponse.value.itemList;
    print('Data: $data'); // Print the data

    setState(() {}); // Trigger a rebuild after data is fetched
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: middleController.apiResponse,
              builder: (middleList) => ListView.builder(
                itemCount: middleList.length,
                itemBuilder: (context, index) => WidgetMiddle(
                  middleModel: middleList[index],
                  loadDataFunction: loadData,
                ),
              ),
            )),
          ),

        ],
      ),
    );
  }
} */