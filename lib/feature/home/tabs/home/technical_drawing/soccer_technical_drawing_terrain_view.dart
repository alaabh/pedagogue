import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../model/player_terrain_model.dart';
import 'draggable_image.dart';

class TechnicalDrawingTerrainView extends StatefulWidget {
  final String terrainAsset;
  final List<String> assetList;
  final Team? team1;
  final Team? team2;

  const TechnicalDrawingTerrainView({
    super.key,
    required this.terrainAsset,
    required this.assetList,
    this.team1,
    this.team2,
  });

  @override
  State<TechnicalDrawingTerrainView> createState() =>
      _TechnicalDrawingTerrainViewState();
}

class _TechnicalDrawingTerrainViewState
    extends State<TechnicalDrawingTerrainView> {
  final ScrollController _scrollController = ScrollController();

  List<DraggableImage> currentImageList = [];

  void addObject({
    required String? id,
    String? name,
    int? tag,
    required Offset position,
    required double iconSize,
  }) {
    if (id != null) {
      final currentImageListWithSameId = currentImageList.where(
        (e) => e.id == id && e.tag != -1,
      );

      int maxTag;

      if (currentImageListWithSameId.isNotEmpty) {
        maxTag = currentImageListWithSameId
            .reduce((curr, next) => curr.tag > next.tag ? curr : next)
            .tag;

        currentImageList.removeWhere(
          (e) => id == e.id && tag == e.tag,
        );
      } else {
        maxTag = 0;
      }

      final draggableImage = DraggableImage(
        id: id,
        iconSize: iconSize,
        name: name,
        tag: maxTag + 1,
        position: position,
        isPlaced: true,
      );

      currentImageList.add(draggableImage);
    } else {
      if (kDebugMode) print('Object is null');
    }
  }

  List<dynamic>? playerTeam1 = [];
  List<dynamic>? playerTeam2 = [];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.team1 != null) {
      playerTeam1 = widget.team1!.player;
      playerTeam2 = widget.team2!.player;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    final screenWidth = MediaQuery.of(context).size.width;

    const iconSize = 40.0;
    String name = "";

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.primaryDarkColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.primaryDarkColor,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.85,
            color: AppColors.primaryDarkColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenWidth * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${intl.team} A",
                                  style: TextStyle(color: Colors.white),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (String result) {
                                    setState(() {
                                      name = result;
                                    });
                                    addObject(
                                      id: widget.assetList[0],
                                      name: result,
                                      position: Offset(
                                        screenWidth / 2.7,
                                        screenHeight / 2.43,
                                      ),
                                      iconSize: iconSize,
                                    );
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    ...playerTeam1!
                                        .map((player) => PopupMenuItem<String>(
                                              value: player['number_garment']
                                                  .toString(), // Ensure the value is a string
                                              child: Text(
                                                  'n° ${player['number_garment']} : ${player['firstName']} ${player['lastName']}'),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${intl.team} B",
                                  style: TextStyle(color: Colors.white),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (String result) {
                                    setState(() {
                                      name = result;
                                    });
                                    addObject(
                                      id: widget.assetList[1],
                                      name: result,
                                      position: Offset(
                                        screenWidth / 2.7,
                                        screenHeight / 2.43,
                                      ),
                                      iconSize: iconSize,
                                    );
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    ...playerTeam2!
                                        .map((player) => PopupMenuItem<String>(
                                              value: player['number_garment']
                                                  .toString(), // Ensure the value is a string
                                              child: Text(
                                                  'n° ${player['number_garment']} : ${player['firstName']} ${player['lastName']}'),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        height: screenWidth * 0.9,
                        widget.terrainAsset,
                      ),
                    ],
                  ),
                ),
                DragTarget<DraggableImage>(
                  builder: (_, __, ___) => Stack(
                    children: List.generate(
                      currentImageList.length,
                      (index) => Positioned(
                        left: currentImageList[index].position!.dx,
                        top: currentImageList[index].position!.dy -
                            (screenHeight / 22.3),
                        child: currentImageList[index],
                      ),
                    ),
                  ),
                  onAcceptWithDetails:
                      (DragTargetDetails<DraggableImage> details) => addObject(
                    id: details.data.id,
                    name: name,
                    tag: details.data.tag,
                    position: details.offset,
                    iconSize: iconSize,
                  ),
                  onLeave: (data) => currentImageList.removeWhere(
                    (e) => e.id == data?.id && e.tag == data?.tag,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.15,
            width: double.maxFinite,
            child: Card(
              color: Colors.white.withOpacity(0.7),
              margin: Dimensions.paddingExtraLarge,
              clipBehavior: Clip.hardEdge,
              child: Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    children: List.generate(
                      widget.assetList.length,
                      (index) => Card(
                        color: Colors.white,
                        margin: Dimensions.paddingMedium,
                        child: Padding(
                          padding: Dimensions.paddingLarge,
                          child: GestureDetector(
                            onTap: () {
                              addObject(
                                id: widget.assetList[index],
                                name: name,
                                position: Offset(
                                  screenWidth / 2.7,
                                  screenHeight / 2.43,
                                ),
                                iconSize: iconSize,
                              );
                              setState(() {});
                            },
                            child: DraggableImage(
                              name: name,
                              id: widget.assetList[index],
                              iconSize: iconSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
