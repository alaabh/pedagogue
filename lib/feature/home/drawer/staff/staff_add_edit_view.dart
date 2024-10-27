import 'package:flutter/material.dart';
import 'package:pedagogue/controller/staff_controller.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/staff.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';
import '../../../../utils/date_time_utils.dart';

class StaffAddEditView extends StatefulWidget {
  final StaffType staffType;
  final Staff? staff;

  const StaffAddEditView({
    super.key,
    required this.staffType,
    this.staff,
  });

  @override
  State<StaffAddEditView> createState() => _StaffAddEditViewState();
}

class _StaffAddEditViewState extends State<StaffAddEditView> {
  // API
  StaffController staffController = StaffController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController birthplaceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  DateTime? selectedBirthDate;

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    Staff staff = Staff(
      id: widget.staff?.id,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      sex: sexController.text,
      birthdate: selectedBirthDate,
      birthplace: birthplaceController.text,
      mobile: mobileController.text,
      address: addressController.text,
      country: countryController.text,
      zipCode: zipCodeController.text,
      city: cityController.text,
      staffType: widget.staffType,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.staff != null
          ? staffController.update(staff)
          : staffController.add(staff),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.staff != null) {
      firstNameController.text = widget.staff?.firstName ?? '';
      lastNameController.text = widget.staff?.lastName ?? '';
      emailController.text = widget.staff?.email ?? '';
      sexController.text = widget.staff?.sex ?? '';
      selectedBirthDate = widget.staff?.birthdate;
      birthplaceController.text = widget.staff?.birthplace ?? '';
      mobileController.text = widget.staff?.mobile ?? '';
      addressController.text = widget.staff?.address ?? '';
      countryController.text = widget.staff?.country ?? '';
      zipCodeController.text = widget.staff?.zipCode ?? '';
      cityController.text = widget.staff?.city ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.staff == null
              ? intl.addNew('${widget.staffType.localizedValue} '
                  '${intl.staff}')
              : intl.update(intl.staff),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: Dimensions.paddingLarge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      inputType: InputType.text,
                      controller: firstNameController,
                      title: intl.firstName,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: lastNameController,
                      title: intl.lastName,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: emailController,
                      title: intl.email,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.dropdown,
                      controller: sexController,
                      dropdownItems: [intl.male, intl.female],
                      title: intl.sex,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.date,
                      controller: TextEditingController(
                        text: DateTimeUtils.stringFromDate(selectedBirthDate),
                      ),
                      onSelectedDateTime: (value) => selectedBirthDate = value,
                      title: intl.birthdate,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: birthplaceController,
                      title: intl.birthPlace,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: mobileController,
                      title: intl.mobile,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: addressController,
                      title: intl.address,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: countryController,
                      title: intl.country,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: zipCodeController,
                      title: intl.zipCode,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: cityController,
                      title: intl.city,
                    ),
                  ],
                ),
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
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
        text: intl.save,
        onPressed: submit,
        width: MediaQuery.of(context).size.width * 0.18,
      ),
    );
  }
}
