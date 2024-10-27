import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../l10n/localization.dart';
import '../../model/actionDetail_model.dart';
import '../../shared/style/dimensions.dart';
import '../espqceEPS/ficheDePresence/save_file_mobile.dart';

class StepTrieVideoRecorder extends StatefulWidget {
  final String? selectedTerrainImage;
  final String? videoUrl;

  const StepTrieVideoRecorder(
      {Key? key, this.selectedTerrainImage, this.videoUrl})
      : super(key: key);

  @override
  _StepTrieVideoRecorderState createState() => _StepTrieVideoRecorderState();
}

class _StepTrieVideoRecorderState extends State<StepTrieVideoRecorder> {
  final GlobalKey _dropdownKey = GlobalKey();

  List<TextEditingController> localPlayers = List.generate(
      18, (index) => TextEditingController(text: 'J${index + 1}'));
  List<TextEditingController> visitorPlayers = List.generate(
      18, (index) => TextEditingController(text: 'J${index + 1}'));
  List<ActionDetail> actions = [];
  String localvisitor = "";
  String playerName = "";
  List<String> events = [
    "${intl.videoTir}",
    "${intl.videoAssistbut}",
    "${intl.videoDribble}",
    "${intl.videoCentrage}",
    "${intl.videoPasse}",
    "${intl.videoPassecle}",
    "${intl.videoInterceptions}",
    "${intl.videoDegagements}",
    "${intl.videoFautes}",
  ];
  String? selectedEvent;
  YoutubePlayerController? _youtubePlayerController;
  bool isDropdownExpanded = true;

  @override
  void initState() {
    super.initState();
    final String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl ?? "");
    if (videoId != null) {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(autoPlay: true, mute: false),
      );
    }
  }

  void addAction(String team, String player, Offset position) {
    if (selectedEvent == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select an event first."),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    if (playerName == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select a player first."),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    setState(() {
      actions.add(ActionDetail(
        team: team,
        player: player,
        event: selectedEvent!,
        x: position.dx,
        y: position.dy,
      ));
    });
  }

  Future<void> writePdfFile(List<ActionDetail> actions) async {
    // Create a PDF document
    final pdf = p.Document();
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    // Add a page to the PDF
    pdf.addPage(p.Page(
      build: (context) {
        return p.TableHelper.fromTextArray(
          context: context,
          cellStyle: p.TextStyle(
            font: ttf,
          ),
          tableDirection:
              langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
          headerDirection:
              langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
          headerStyle: p.TextStyle(
            font: ttf,
          ),
          data: [
            [intl.team, intl.player, intl.event, "x", "y"],
            for (var action in actions) action.toCsvRow(),
          ],
        );
      },
    ));

    // Get the directory to save the file
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/actions.pdf';

    // Write the PDF to the file
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "videoCoder.pdf");

    print('PDF file saved at $path');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _youtubePlayerController != null
                ? YoutubePlayer(
                    controller: _youtubePlayerController!,
                    showVideoProgressIndicator: true,
                  )
                : Center(child: Text("${intl.invalidYouTubeURL}")),
            SizedBox(height: 20),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                addAction(localvisitor, playerName,
                    details.globalPosition); // Use the selected event
              },
              child: Stack(
                children: [
                  if (widget.selectedTerrainImage != null)
                    Image.asset(widget.selectedTerrainImage!,
                        fit: BoxFit.cover),
                ],
              ),
            ),
            buildEventSelector(),
            buildPlayerListCard("${intl.local}", localPlayers),
            buildPlayerListCard("${intl.visitor}", visitorPlayers),
            buildActionDataTable(),
            Dimensions.verticalSpacingExtraLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  width: MediaQuery.of(context).size.width * 0.4,
                  text: intl.exportPdf,
                  onPressed: () async {
                    await writePdfFile(actions);
                  },
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width * 0.4,
                  text: intl.deletaLast,
                  onPressed: () {
                    setState(() {
                      actions.removeLast();
                    });
                  },
                ),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEventSelector() {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return DropdownButton<String>(
              key: _dropdownKey,
              isExpanded: true,
              value: selectedEvent,
              hint: Text("Select Event"),
              items: _buildDropdownMenuItems(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedEvent = value;
                  });
                }
              },
              onTap: () {
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = events.map((event) {
      return DropdownMenuItem(
        value: event,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(event),
            if (isDropdownExpanded)
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditEventDialog(event);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        events.remove(event);
                      });
                      Navigator.pop(_dropdownKey.currentContext!);
                    },
                  ),
                ],
              ),
          ],
        ),
      );
    }).toList();

    items.add(DropdownMenuItem(
      value: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add another event"),
          if (isDropdownExpanded)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _showAddEventDialog();
              },
            ),
        ],
      ),
    ));

    return items;
  }

  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newEvent = '';
        return AlertDialog(
          title: Text('Add Event'),
          content: TextField(
            onChanged: (value) {
              newEvent = value;
            },
            decoration: InputDecoration(hintText: "Event Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  events.add(newEvent);
                });
                Navigator.pop(_dropdownKey.currentContext!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditEventDialog(String event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedEvent = event;
        TextEditingController controller = TextEditingController(text: event);
        return AlertDialog(
          title: Text('Edit Event'),
          content: TextField(
            controller: controller,
            onChanged: (value) {
              editedEvent = value;
            },
            decoration: InputDecoration(hintText: "Event Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  int index = events.indexOf(event);
                  if (index != -1) {
                    events[index] = editedEvent;
                  }
                });
                Navigator.pop(_dropdownKey.currentContext!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool enbaleedit = false;
  Widget buildPlayerListCard(
      String teamName, List<TextEditingController> players) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(teamName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: players.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                      onDoubleTap: () {
                        setState(() {
                          enbaleedit = true;
                        });
                      },
                      onTap: () {
                        setState(() {
                          localvisitor = teamName;
                          playerName = players[index].text;
                        });
                      },
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              enbaleedit = false;
                            });
                          },
                          enabled: enbaleedit,
                          controller: players[index],
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('${intl.team}')),
          DataColumn(label: Text('${intl.player}')),
          DataColumn(label: Text('${intl.event}')),
          DataColumn(label: Text('X')),
          DataColumn(label: Text('Y')),
        ],
        rows: actions
            .map<DataRow>((action) => DataRow(cells: [
                  DataCell(Text(action.team)),
                  DataCell(Text(action.player)),
                  DataCell(Text(action.event)),
                  DataCell(Text('${action.x.toStringAsFixed(2)}')),
                  DataCell(Text('${action.y.toStringAsFixed(2)}')),
                ]))
            .toList(),
      ),
    );
  }
}
