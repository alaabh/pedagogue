import 'package:flutter/material.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/model/user.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/media/api_image_widget.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../shared/style/app_color.dart';

class UserWidget extends StatelessWidget {
  final Function(User) callback;
  final User user;

  const UserWidget({
    super.key,
    required this.user,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dimensions.verticalSpacingSmall,
        InkWell(
          onTap: () => callback(user),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ApiImageWidget(
                    width: 60,
                    height: 60,
                    imageFilename: user.image,
                    baseUrl: imageWebUrl,
                    isProfilePicture: true,
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (user.isOnline ?? false)
                                ? AppColors.successColor
                                : AppColors.warningColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: Dimensions.smallValue),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          '${user.fullName ?? intl.unknown}',
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          user.email ?? '',
                          maxLines: 1,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Dimensions.verticalSpacingSmall,
        const Divider(),
      ],
    );
  }
}
