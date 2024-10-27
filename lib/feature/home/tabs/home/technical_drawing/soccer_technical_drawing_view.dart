import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/home/tabs/home/technical_drawing/soccer_technical_drawing_terrain_view.dart';
import 'package:pedagogue/shared/style/assets.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../../controller/player_terrain_controller.dart';
import '../../../../../l10n/localization.dart';

class TechnicalDrawingView extends StatefulWidget {
  const TechnicalDrawingView({super.key});

  @override
  State<TechnicalDrawingView> createState() => _TechnicalDrawingViewState();
}

class _TechnicalDrawingViewState extends State<TechnicalDrawingView> {
  final PlayerTerrainController playerTerrainController =
      Get.put(PlayerTerrainController());
  @override
  void initState() {
    // TODO: implement initState
    playerTerrainController.fetchPlayerTerrain();
    print("be5555555555555555555555555555555");
    // print(playerTerrainController.playerTerrain.value.team1!.player);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.technicalDrawing)),
      body: Padding(
        padding: Dimensions.paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: FilledButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TechnicalDrawingTerrainView(
                      team1: playerTerrainController.playerTerrain.value.team1,
                      team2: playerTerrainController.playerTerrain.value.team2,
                      terrainAsset: TechnicalDrawingAssets.footballTerrain,
                      assetList: TechnicalDrawingAssets.footballDraggableItems,
                    ),
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                ),
                label: Text(intl.soccer),
                icon: Image.asset(
                  TechnicalDrawingAssets.footballIcon,
                  width: Dimensions.iconSizeSmall,
                  height: Dimensions.iconSizeSmall,
                ),
              ),
            ),
            Dimensions.verticalSpacingMedium,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset:
                                TechnicalDrawingAssets.basketballTerrain,
                            assetList:
                                TechnicalDrawingAssets.basketballDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.orange.shade400,
                      ),
                      label: Text(intl.basketball),
                      icon: Image.asset(
                        TechnicalDrawingAssets.basketballIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
                Dimensions.horizontalSpacingMedium,
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset:
                                TechnicalDrawingAssets.handballTerrain,
                            assetList:
                                TechnicalDrawingAssets.handballDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red.shade200,
                      ),
                      label: Text(intl.handball),
                      icon: Image.asset(
                        TechnicalDrawingAssets.handballIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Dimensions.verticalSpacingMedium,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset:
                                TechnicalDrawingAssets.volleyballTerrain,
                            assetList:
                                TechnicalDrawingAssets.volleyballDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      label: Text(intl.volleyball),
                      icon: Image.asset(
                        TechnicalDrawingAssets.volleyballIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
                Dimensions.horizontalSpacingMedium,
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset: TechnicalDrawingAssets.rugbyTerrain,
                            assetList:
                                TechnicalDrawingAssets.rugbyDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.brown.shade200,
                      ),
                      label: Text(intl.rugby),
                      icon: Image.asset(
                        TechnicalDrawingAssets.rugbyIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Dimensions.verticalSpacingMedium,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset: TechnicalDrawingAssets.tennisTerrain,
                            assetList:
                                TechnicalDrawingAssets.tennisDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      label: Text(intl.tennis),
                      icon: Image.asset(
                        TechnicalDrawingAssets.tennisIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
                Dimensions.horizontalSpacingMedium,
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TechnicalDrawingTerrainView(
                            terrainAsset:
                                TechnicalDrawingAssets.athleticsTerrain,
                            assetList:
                                TechnicalDrawingAssets.athleticsDraggableItems,
                          ),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                      ),
                      label: Text(intl.athletics),
                      icon: Image.asset(
                        TechnicalDrawingAssets.athleticsIcon,
                        width: Dimensions.iconSizeSmall,
                        height: Dimensions.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
