import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/Joueur_model.dart';
import 'package:pedagogue/utils/date_time_utils.dart';
import 'package:pedagogue/utils/resources/api/api_response.dart';

import '../../model/base_model.dart';
import '../../utils/switch_case.dart';
import '../style/app_color.dart';
import '../style/dimensions.dart';
import 'custom_error_widget.dart';
import 'loading_widget.dart';

enum InputType {
  text,
  date,
  time,
  dropdown,
  apiDropdown,
  rating,
}

class CustomInput<Model extends BaseModel> extends StatefulWidget {
  final double? height;
  final InputType inputType;
  final TextEditingController? controller;
  final String? title;
  final bool centerTitle;
  final String? hint;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final List<String>? dropdownItems;
  final List<String>? dropdownTitleItems;
  final bool isRequired;
  final Widget? child;
  final Rx<ApiResponse<Model>>? apiResponse;
  final Function(dynamic)? onSelectElement;
  final Model? selectedElement;
  final Function(DateTime value)? onSelectedDateTime;
  final Function(Player player)? itemLabelBuilder;

  const CustomInput({
    super.key,
    this.height,
    required this.inputType,
    this.controller,
    this.title,
    this.centerTitle = false,
    this.hint,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.dropdownItems,
    this.dropdownTitleItems,
    this.isRequired = false,
    this.child,
    this.apiResponse,
    this.onSelectElement,
    this.selectedElement,
    this.onSelectedDateTime,
    this.itemLabelBuilder,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late String? Function(dynamic) validator;

  late String hint = widget.hint ??
      (widget.title != null ? intl.inputHint(widget.title!) : '');

  Future<void> _selectTime() async {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((TimeOfDay? time) {
      if (time != null) {
        setState(() => widget.controller?.text = "${time.hour}:${time.minute}");
      }
    });
  }

  Future<void> _selectDate() async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2050, 1, 1),
    ).then((DateTime? dateTime) {
      if (dateTime != null) {
        if (widget.onSelectedDateTime != null) {
          widget.onSelectedDateTime!(dateTime);
        }

        setState(
          () => widget.controller?.text = DateTimeUtils.stringFromDate(
            dateTime,
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    validator = (value) {
      if (widget.isRequired && (value ?? '').isEmpty) {
        return intl.inputControl(widget.title ?? '');
      }

      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          SizedBox(
            width: double.maxFinite,
            child: RichText(
              textAlign:
                  widget.centerTitle ? TextAlign.center : TextAlign.start,
              text: TextSpan(
                text: widget.title,
                style: DefaultTextStyle.of(context).style,
                children: [
                  if (widget.isRequired)
                    const TextSpan(
                        text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        if (widget.title != null) Dimensions.verticalSpacingMedium,
        SizedBox(
          height: widget.height,
          child: switchCase(
            widget.inputType,
            {
              InputType.text: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(hintText: hint),
                maxLength: widget.maxLength,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                validator: validator,
              ),
              InputType.date: TextFormField(
                controller: widget.controller,
                readOnly: true,
                onTap: _selectDate,
                decoration: InputDecoration(
                  hintText: hint,
                  suffixIcon: const Icon(Icons.date_range),
                ),
                validator: validator,
              ),
              InputType.time: TextFormField(
                controller: widget.controller,
                readOnly: true,
                onTap: _selectTime,
                decoration: InputDecoration(
                  hintText: widget.hint ?? '--:--',
                  suffixIcon: const Icon(Icons.access_time_outlined),
                ),
                validator: validator,
              ),
              InputType.dropdown: _buildDropdown(
                widget.dropdownItems ?? ['Empty'],
                hint,
                dropdownTitleItems: widget.dropdownTitleItems,
              ),
              InputType.apiDropdown: _buildApiDropdown(
                widget.apiResponse,
                hint,
              ),
              InputType.rating: _buildRating(),
            },
            defaultValue: const SizedBox.shrink(),
          ),
        )
      ],
    );
  }

  Widget _buildDropdown(
    List<String> items,
    String? hint, {
    List<String>? dropdownTitleItems,
  }) {
    var value = widget.controller?.text ?? '';

    if (items.isEmpty) {
      return Container(
        height: 60,
        padding: Dimensions.paddingMedium,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade800),
          borderRadius: Dimensions.mediumBorderRadius,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomErrorWidget(
              errorText: null,
              iconSize: Dimensions.iconSizeSmall,
            ),
            Text("ItemList is empty"),
          ],
        ),
      );
    }

    if (value.isNotEmpty && !items.contains(value)) value = '';

    return DropdownButtonFormField<String>(
      menuMaxHeight: 400,
      value: value.isEmpty ? null : value,
      hint: Text(
        hint ?? '',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.visible,
        ),
        maxLines: 1,
      ),
      isExpanded: true,
      items: items
          .map(
            (String item) => DropdownMenuItem(
              enabled: dropdownTitleItems == null
                  ? true
                  : !dropdownTitleItems.contains(item),
              value: item,
              child: Text(
                '${dropdownTitleItems != null && !dropdownTitleItems.contains(item) ? ' ' : ''}'
                '$item',
                style: TextStyle(
                  color: item == widget.controller?.text
                      ? AppColors.accentColor
                      : null,
                  overflow: TextOverflow.visible,
                  fontWeight: dropdownTitleItems != null
                      ? dropdownTitleItems.contains(item)
                          ? FontWeight.bold
                          : FontWeight.w400
                      : null,
                ),
                maxLines: 2,
              ),
            ),
          )
          .toList(),
      onChanged: (String? newValue) {
        setState(() => widget.controller?.text = newValue ?? '');
      },
      validator: validator,
    );
  }

  Widget _buildApiDropdown(
    final Rx<ApiResponse<BaseModel>>? apiResponse,
    String? hint,
  ) {
    return Obx(
      () {
        switch (apiResponse!.value.status) {
          case ApiStatus.completed:
            return DropdownButtonFormField<BaseModel>(
              value: widget.selectedElement,
              hint: Text(
                hint ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              isExpanded: true,
              items: apiResponse.value.itemList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.mainAttribute,
                        style: TextStyle(
                          color: item == widget.selectedElement
                              ? AppColors.accentColor
                              : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                if (widget.onSelectElement != null && newValue != null) {
                  widget.onSelectElement!(newValue);
                  setState(() {});
                }
              },
              validator: validator,
            );
          case ApiStatus.loading:
            return Container(
              height: 60,
              padding: Dimensions.paddingMedium,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: Dimensions.mediumBorderRadius,
              ),
              child: const LoadingWidget(
                size: Dimensions.iconSizeSmall,
              ),
            );
          case ApiStatus.error:
            return Container(
              height: 60,
              padding: Dimensions.paddingMedium,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: Dimensions.mediumBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomErrorWidget(
                    errorText: null,
                    iconSize: Dimensions.iconSizeSmall,
                  ),
                  Text(apiResponse.value.message),
                ],
              ),
            );
        }
      },
    );
  }

  Widget _buildRating() {
    return StatefulBuilder(
      builder: (context, setState) {
        int rating = int.tryParse(widget.controller?.text ?? '') ?? 0;

        return Row(
          children: [
            IconButton(
              onPressed: () => setState(() => widget.controller?.text = '1'),
              icon: Icon(
                rating > 0 ? Icons.star : Icons.star_outline,
                color:
                    rating > 0 ? AppColors.primaryColor : Colors.grey.shade600,
                size: Dimensions.iconSizeLarge,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => widget.controller?.text = '2'),
              icon: Icon(
                rating > 1 ? Icons.star : Icons.star_outline,
                color:
                    rating > 1 ? AppColors.primaryColor : Colors.grey.shade600,
                size: Dimensions.iconSizeLarge,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => widget.controller?.text = '3'),
              icon: Icon(
                rating > 2 ? Icons.star : Icons.star_outline,
                color:
                    rating > 2 ? AppColors.primaryColor : Colors.grey.shade600,
                size: Dimensions.iconSizeLarge,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => widget.controller?.text = '4'),
              icon: Icon(
                rating > 3 ? Icons.star : Icons.star_outline,
                color:
                    rating > 3 ? AppColors.primaryColor : Colors.grey.shade600,
                size: Dimensions.iconSizeLarge,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => widget.controller?.text = '5'),
              icon: Icon(
                rating > 4 ? Icons.star : Icons.star_outline,
                color:
                    rating > 4 ? AppColors.primaryColor : Colors.grey.shade600,
                size: Dimensions.iconSizeLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
