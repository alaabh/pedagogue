import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/drawer/season/season_add_edit_view.dart';
import 'package:pedagogue/feature/home/drawer/team/team_add_edit_view.dart';
import 'package:pedagogue/feature/home/drawer/team/team_list_view.dart';

import '../../l10n/localization.dart';
import '../../shared/style/assets.dart';
import '../../shared/style/dimensions.dart';
import 'drawer/season/season_list_view.dart';
import 'drawer/staff/staff_list_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: Dimensions.paddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Dimensions.paddingHuge,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    100), // Set the radius to 50.0 for a circular image
                child: Image.asset(
                  Assets.logoLight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(intl.teams, style: const TextStyle(color: Colors.grey)),
            Dimensions.verticalSpacingMedium,
            _buildDrawerButton(
              context: context,
              title: intl.list,
              iconData: "assets/list1.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeamListView(),
                ),
              ),
            ),
            _buildDrawerButton(
              context: context,
              title: intl.create,
              iconData: "assets/plus.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeamAddEditView(),
                ),
              ),
            ),
            const Divider(),
            Dimensions.verticalSpacingMedium,
            Text(intl.season, style: const TextStyle(color: Colors.grey)),
            Dimensions.verticalSpacingMedium,
            _buildDrawerButton(
              context: context,
              title: intl.list,
              iconData: "assets/list1.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SeasonListView(),
                ),
              ),
            ),
            Dimensions.verticalSpacingMedium,
            _buildDrawerButton(
              context: context,
              title: intl.add,
              iconData: "assets/plus.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SeasonAddEditView(),
                ),
              ),
            ),
            const Divider(),
            Dimensions.verticalSpacingMedium,
            Text(intl.staff, style: const TextStyle(color: Colors.grey)),
            Dimensions.verticalSpacingMedium,
            _buildDrawerButton(
              context: context,
              title: intl.list,
              iconData: "assets/list1.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StaffListView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton({
    required BuildContext context,
    required String title,
    required String iconData,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: Dimensions.paddingLargeVertical,
        width: double.maxFinite,
        child: Row(
          children: [
            Image.asset(
              iconData,
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Dimensions.horizontalSpacingExtraLarge,
            Text(title),
          ],
        ),
      ),
    );
  }
}
