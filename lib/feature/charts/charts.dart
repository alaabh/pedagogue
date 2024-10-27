import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../l10n/localization.dart';
import '../../shared/style/dimensions.dart';
import '../../utils/resources/api/token_manager.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  Future<void> getResult(String urlData) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/statics/$urlData');
    final response = await http.get(
      url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        if (urlData == "sessions") {
          dataCharts = data["data_charts"];
          countSessions = data["count_sessions"];
          countLoader += 1;
        }
        if (urlData == "matches") {
          matches = data["data"];
          countLoader += 1;
        }
        if (urlData == "goals_scored") {
          goals_scored = data["data"];
          countLoader += 1;
        }
        if (urlData == "goals_conceded") {
          goals_conceded = data["data"];
          countLoader += 1;
        }

        if (urlData == "red_card") {
          reports_red_card = data["data"];

          countLoader += 1;
        }
        if (urlData == "yellow_card") {
          reports_yellow_card = data["data"];

          countLoader += 1;
        }
        if (urlData == "players_presence") {
          players_Attendance = data["data"];

          countLoader += 1;
        }
        if (urlData == "players_trial") {
          players_trial = data["data"];

          countLoader += 1;
        }
        if (urlData == "players_suspended") {
          players_trial = data["data"];

          countLoader += 1;
        }
        if (urlData == "players_injured") {
          players_trial = data["data"];

          countLoader += 1;
        }
        if (urlData == "players_played") {
          count_players = data["count_players"];
          playerNames = data["data_player_name"];
          values = data["data_value"];

          for (int i = 0; i < playerNames.length; i++) {
            chartData.add(ChartData(playerNames[i], values[i]));
          }
          countLoader += 1;
        }

        print(data);
      });

      print(data);
    } else {}
  }

  List<ChartData> chartData = [];
  int countLoader = 0;
  List<dynamic> dataCharts = [];
  List<dynamic> playerNames = [];
  List<dynamic> values = [];
  int countSessions = 0;
  int count_players = 0;
  dynamic matches = "0";
  dynamic goals_scored = "0";
  dynamic goals_conceded = "0";
  dynamic reports_yellow_card = "0";
  dynamic reports_red_card = "0";
  dynamic players_Attendance = "0";
  dynamic players_trial = "0";
  dynamic players_suspended = "0";
  dynamic players_injured = "0";

  @override
  void initState() {
    // TODO: implement initState
    getResult("sessions");
    getResult("matches");
    getResult("goals_scored");
    getResult("goals_conceded");
    getResult("players_played");
    getResult("red_card");
    getResult("yellow_card");
    getResult("players_presence");
    getResult("players_trial");
    getResult("players_suspended");
    getResult("players_injured");
    super.initState();
  }

  // Create a list of data for the chart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.chart),
      ),
      body: SingleChildScrollView(
        padding: Dimensions.paddingMedium,
        child: countLoader != 11
            ? LoadingWidget()
            : Column(
                children: [
                  Dimensions.verticalSpacingSmall,
                  SfCartesianChart(
                    primaryXAxis: DateTimeAxis(
                      intervalType: DateTimeIntervalType.days,
                      interval: 7, // Represent week intervals
                      dateFormat: DateFormat('yMMMd'),
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: countSessions.toDouble(),
                      interval: 1,
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    title: ChartTitle(text: intl.sessionsCount),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                      enablePinching: true,
                      zoomMode: ZoomMode.x,
                    ),
                    series: <LineSeries<dynamic, DateTime>>[
                      LineSeries<dynamic, DateTime>(
                        dataSource: dataCharts,
                        xValueMapper: (dynamic data, _) =>
                            DateTime(data['Year'], 1)
                                .add(Duration(days: (data['Week'] - 1) * 7)),
                        yValueMapper: (dynamic data, _) => data['Total'],
                        name: 'Total',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        markerSettings: MarkerSettings(isVisible: true),
                      )
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.injuredPlayers))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$players_injured"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child:
                                  Center(child: Text(intl.suspendedPlayers))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$players_suspended"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.trialPlayers))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$players_trial"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child:
                                  Center(child: Text(intl.playersAttendance))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child:
                                  Center(child: Text("$players_Attendance"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.matchesPlayed))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$matches"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.scorer))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$goals_scored"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.goalsConceded))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$goals_conceded"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.yellowCard))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child:
                                  Center(child: Text("$reports_yellow_card"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Card(
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text(intl.redCard))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(child: Text("$reports_red_card"))),
                        ],
                      ),
                    ),
                  ),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: count_players.toDouble(),
                        interval: 1),
                    title: ChartTitle(text: intl.matches),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ColumnSeries<ChartData, String>>[
                      ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.playerName,
                        yValueMapper: (ChartData data, _) => data.value,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      )
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                ],
              ),
      ),
    );
  }
}

class ChartData {
  final String playerName;
  final int value;

  ChartData(this.playerName, this.value);
}
