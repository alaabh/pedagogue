import 'package:flutter/material.dart';

import '../../../controller/JoueurDessai_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/joueurDessai.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/DropdownTextField.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class stepTwodessai extends StatefulWidget {
   JoueurDessai? joueurDessai;
 TextEditingController? addressController;

  TextEditingController? cityController;

  TextEditingController? emailController;
  TextEditingController? ZipCodeController;

  TextEditingController? phoneController;
  TextEditingController? countryController;

  stepTwodessai({
    super.key,
    this.joueurDessai,
        this.addressController,
    this.cityController,
    this.emailController,
    this.ZipCodeController,
    this.phoneController,
    this.countryController,
  });

  @override
  State<stepTwodessai> createState() => _stepTwodessaiState();
}

class _stepTwodessaiState extends State<stepTwodessai> {
  final _formKey = GlobalKey<FormState>();
 

  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimensions.verticalSpacingSmall,
            Text(
              intl.address,
              style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.addressController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.city,
             style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.cityController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.email,
               style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.emailController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.zipCode,
              style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: ' ',
              controller: widget.ZipCodeController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.country,
             style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            CustomInput(
              inputType: InputType.dropdown,
              dropdownItems: [
                'Tunisia',
                'hhhhh',
                'ycghkj',
                'ghjo;k',
                'kjhk[k',
                'jiohiuh',
                'jiujpo',
                'jnouh/',
              ],
              controller: widget.countryController,
            ),

            Dimensions.verticalSpacingSmall,
            Text(
              intl.mobile,
              style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
            ),
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.phoneController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            // _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}







