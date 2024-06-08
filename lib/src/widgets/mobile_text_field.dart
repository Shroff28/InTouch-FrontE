import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/app_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class MobileTextField extends StatefulWidget {
  final String hint;
  final FocusNode focusNode;
  final TextInputType type;
  final bool enabled;
  final Color hintColor;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController controller;
  final Function(PhoneNumber?)? onSaved;
  final String? Function(PhoneNumber?)? validateFunction;
  final Function(PhoneNumber)? onChanged;
  final Function(Country)? onCountryChanged;
  final Color borderColor;

  const MobileTextField({
    Key? key,
    required this.hint,
    required this.focusNode,
    required this.borderColor,
    required this.type,
    required this.textInputAction,
    this.enabled = true,
    this.onSaved,
    this.validateFunction,
    this.onCountryChanged,
    this.textInputFormatter,
    this.onChanged,
    required this.hintColor,
    required this.controller,
  }) : super(key: key);

  @override
  State<MobileTextField> createState() => _MobileTextFieldState();
}

class _MobileTextFieldState extends State<MobileTextField> {
  String number = PhoneNumber(
          countryISOCode: Platform.localeName.split('_').last,
          countryCode: 'US',
          number: '')
      .countryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ThemeText(
            text: widget.hint,
            lightTextColor: primaryTextColor,
            fontSize: fontSize16,
            fontWeight: fontWeightMedium,
          ),
        ),
        IntlPhoneField(
          initialCountryCode: 'US',
          initialValue: number,
          invalidNumberMessage: "Phone Number is invalid",
          pickerDialogStyle: PickerDialogStyle(backgroundColor: whiteColor),
          cursorColor: primaryColor,
          autofocus: false,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onCountryChanged: widget.onCountryChanged,
          enabled: widget.enabled,
          showCountryFlag: false,
          style: const TextStyle(
            color: blackColor,
            fontSize: fontSize16,
            fontWeight: fontWeightRegular,
            fontFamily: fontFamily,
          ),
          dropdownTextStyle: const TextStyle(
            color: blackColor,
            fontSize: fontSize16,
            fontWeight: fontWeightRegular,
            fontFamily: fontFamily,
          ),
          languageCode: 'en',
          decoration: InputDecoration(
            hintText: widget.hint,
            fillColor: whiteColor,
            filled: true,
            labelStyle: TextStyle(
              color: widget.hintColor,
              fontSize: fontSize14,
              fontFamily: fontFamily,
            ),
            hintStyle: TextStyle(
              color: widget.hintColor,
              fontSize: fontSize18,
              fontFamily: fontFamily,
            ),
            counter: const Offstage(),
            contentPadding: const EdgeInsets.all(0.0),
            errorStyle: const TextStyle(color: redColor),
            errorBorder: const OutlineInputBorder(
              gapPadding: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: redColor, width: 1.0),
            ),
            errorMaxLines: 3,
            enabledBorder: const OutlineInputBorder(
              gapPadding: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              gapPadding: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            border: const OutlineInputBorder(
              gapPadding: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              gapPadding: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: redColor, width: 1),
            ),
          ),
          // validator: widget.validateFunction,
          onSaved: widget.onSaved,
          inputFormatters: widget.textInputFormatter,
          keyboardType: widget.type,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
