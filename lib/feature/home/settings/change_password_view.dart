import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/Widget/custom_dialog.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';

class PasswordChangeView extends StatelessWidget {
  const PasswordChangeView({super.key});

  void submit(BuildContext context) {
    AlertMaker.showSimpleAlertDialog(
      context: context,
      title: intl.information,
      description: intl.notImplementedYet,
      alertType: AlertType.information,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController(
      text: '123456',
    );
    TextEditingController passwordController = TextEditingController(
      text: '123456',
    );
    TextEditingController passwordConfirmationController =
        TextEditingController(
      text: '123456',
    );

    return Scaffold(
      appBar: AppBar(title: Text(intl.changeYourPassword)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: Dimensions.paddingLarge,
              child: Column(
                children: [
                  TextFormField(
                    controller: oldPasswordController,
                    readOnly: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: intl.currentPasswordLabel,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return intl.pleaseEnterYourCurrentPassword;
                      }
                      return null;
                    },
                  ),
                  Dimensions.verticalSpacingMedium,
                  TextFormField(
                    controller: passwordController,
                    readOnly: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: intl.newPasswordLabel,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return intl.pleaseEnterYourNewPassword;
                      }
                      return null;
                    },
                  ),
                  Dimensions.verticalSpacingMedium,
                  TextFormField(
                    controller: passwordConfirmationController,
                    readOnly: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: intl.confirmPasswordLabel,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return intl.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: Dimensions.paddingExtraLarge,
            decoration: BoxDecoration(
              color: AppColors.secondaryBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                )
              ],
            ),
            child: CustomButton(
              text: intl.submit,
              onPressed: () => submit(context),
            ),
          ),
        ],
      ),
    );
  }
}
