import 'package:flutter/material.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/controller/staff_controller.dart';
import 'package:pedagogue/feature/home/drawer/staff/staff_add_edit_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/staff.dart';
import 'package:pedagogue/shared/Widget/media/api_image_widget.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/assets.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../utils/switch_case.dart';

class StaffWidget extends StatelessWidget {
  final StaffType staffType;
  final Staff? staff;
  final Function() loadDataFunction;

  const StaffWidget({
    super.key,
    required this.staffType,
    required this.staff,
    required this.loadDataFunction,
  });

  @override
  Widget build(BuildContext context) {
    // API
    StaffController staffController = StaffController();

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: Dimensions.mediumValue,
        horizontal: Dimensions.largeValue,
      ),
      child: Padding(
        padding: Dimensions.paddingMedium,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApiImageWidget(
              imageFilename: staff?.image ??
                  switchCase(
                    staffType,
                    {
                      StaffType.coach: Assets.coach,
                      StaffType.assistant: Assets.assistant,
                      StaffType.director: Assets.director,
                      StaffType.doctor: Assets.doctor,
                      StaffType.administrative: Assets.administrative,
                      StaffType.delegate: Assets.delegate,
                      StaffType.fitness: Assets.fitness,
                      StaffType.goalkeeper: Assets.goalkeeper,
                      StaffType.material: Assets.material,
                      StaffType.nutritionist: Assets.nutritionist,
                      StaffType.physiotherapist: Assets.physiotherapist,
                      StaffType.statistician: Assets.statistician,
                    },
                    defaultValue: null,
                  ),
              baseUrl: imageWebUrl,
              isProfilePicture: true,
              isAsset: true,
              height: 75,
              width: 75,
              iconSize: 40,
            ),
            Dimensions.horizontalSpacingMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    staff?.fullName ?? intl.elementNotFound(intl.name),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Dimensions.verticalSpacingSmall,
                  Text(
                    staff?.email ?? intl.elementNotFound(intl.email),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Text(
                    staffType.localizedValue,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Dimensions.horizontalSpacingMedium,
            FilledButton.icon(
              onPressed: () => Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => StaffAddEditView(
                        staffType: staffType,
                        staff: staff,
                      ),
                    ),
                  )
                  .whenComplete(loadDataFunction),
              label: Text(intl.open1),
              icon: const Icon(Icons.add_circle),
            )
          ],
        ),
      ),
    );
  }
}
