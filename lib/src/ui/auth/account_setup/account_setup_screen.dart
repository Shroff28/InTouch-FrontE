import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/common_methods.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/date_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/mobile_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';
import 'package:intl/intl.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({Key? key}) : super(key: key);

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _userNameFocus = FocusNode();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _dateOfBirthFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _postalCodeFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<int> _currentTab = ValueNotifier<int>(1);
  final _pickedImage = ValueNotifier<File?>(null);
  String _countryCode = "+1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ValueListenableBuilder<int>(
              valueListenable: _currentTab,
              builder: (context, int tab, child) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ThemeText(
                            text: Localization.of().signUp,
                            lightTextColor: primaryTextColor,
                            fontSize: fontSize36,
                            fontWeight: fontWeightBold,
                          ),
                          ThemeText(
                            text: _currentTab.value == 0
                                ? Localization.of().accountDetails
                                : Localization.of().contactDetails,
                            lightTextColor: primaryTextColor,
                            fontSize: fontSize16,
                            fontWeight: fontWeightRegular,
                          ),
                        ],
                      ),
                    ),
                    _currentTab.value == 0 ? _getFirstTab() : _getSecondTab(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentTab.value == 1
                            ? PrimaryButton(
                                width: 80,
                                height: 20,
                                buttonText: Localization.of().back,
                                buttonColor: primaryColor,
                                onButtonClick: () {
                                  _currentTab.value = 0;
                                },
                              )
                            : const SizedBox(
                                width: 100,
                              ),
                        PrimaryButton(
                          width: 80,
                          height: 20,
                          buttonText: _currentTab.value == 1
                              ? Localization.of().save
                              : Localization.of().next,
                          buttonColor: primaryColor,
                          onButtonClick: () {
                            if (_formKey.currentState!.validate()) {
                              if (_currentTab.value == 0) {
                                _currentTab.value = 1;
                              } else {
                                locator<NavigationUtils>()
                                    .pushAndRemoveUntil(routeTabbar);
                              }
                            }
                          },
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    ).authContainerScaffold(context: context);
  }

  Widget _getFirstTab() {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        _getImageWidget(),
        const SizedBox(height: 8.0),
        _getUserNameTextField(),
        const SizedBox(height: 8.0),
        _getFirstNameTextField(),
        const SizedBox(height: 8.0),
        _getLastNameTextField(),
        const SizedBox(height: 8.0),
        _getDateofBirthTextField(),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _getSecondTab() {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        _getMobileTextField(),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: context.getWidth(0.5), child: _getAddressTextField()),
            SizedBox(
                width: context.getWidth(0.3), child: _getPostalCodeTextField()),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _getFirstNameTextField() {
    return PrimaryTextField(
      hint: Localization.of().firstName,
      focusNode: _firstNameFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: _firstNameController,
      onFieldSubmitted: (value) {
        _firstNameFocus.unfocus();
        _lastNameFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty("First Name is empty");
      },
    );
  }

  Widget _getLastNameTextField() {
    return PrimaryTextField(
      hint: Localization.of().lastName,
      focusNode: _lastNameFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: _lastNameController,
      onFieldSubmitted: (value) {
        _lastNameFocus.unfocus();
        // _dateOfBirthFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty("Last Name is empty");
      },
    );
  }

  Widget _getDateofBirthTextField() {
    return PrimaryTextField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(0),
          lastDate: DateTime.now(),
        );
        _dateOfBirthController.text = DateFormat(DateConstants.boardDateFormat)
            .format(pickedDate ?? DateTime.now());
      },
      hint: Localization.of().dateOfBirth,
      focusNode: _dateOfBirthFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: _dateOfBirthController,
      onFieldSubmitted: (value) {
        _dateOfBirthFocus.unfocus();
      },
      trailingIcon: icCalendar,
      validateFunction: (value) {
        return value!.isFieldEmpty("Date of Birth is empty");
      },
    );
  }

  Widget _getUserNameTextField() {
    return PrimaryTextField(
      hint: Localization.of().userName,
      focusNode: _userNameFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: _userNameController,
      onFieldSubmitted: (value) {
        _userNameFocus.unfocus();
        _firstNameFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty("User name is empty");
      },
    );
  }

  Widget _getMobileTextField() {
    return MobileTextField(
      hint: Localization.of().mobile,
      hintColor: hintColor,
      borderColor: borderColor,
      focusNode: _phoneFocus,
      type: TextInputType.phone,
      textInputAction: TextInputAction.done,
      controller: _phoneController,
      onCountryChanged: (value) {
        setState(() {
          _countryCode = "+${value.dialCode}";
        });
      },
      validateFunction: (value) {
        if (value!.number.isEmpty) {
          return Localization.of().msgPhoneEmpty;
        }
        return null;
      },
    );
  }

  Widget _getAddressTextField() {
    return PrimaryTextField(
      hint: Localization.of().address,
      focusNode: _addressFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: _addressController,
      onFieldSubmitted: (value) {
        _addressFocus.unfocus();
        _postalCodeFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty("Address is Empty");
      },
    );
  }

  Widget _getPostalCodeTextField() {
    return PrimaryTextField(
      hint: Localization.of().postalCode,
      focusNode: _addressFocus,
      type: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: _postalCodeController,
      onFieldSubmitted: (value) {
        _postalCodeFocus.unfocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty("Postal Code is Empty");
      },
    );
  }

  Widget _getImageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            getImageBottomSheet(
              context: context,
              onGalleryClick: () async {
                _pickedImage.value =
                    await getImage(context: context, pickFromCamera: false);
                // if (_pickedImage.value != null) {
                //   await _uploadImage(_pickedImage.value!);
                // }
              },
              onCameraClick: () async {
                _pickedImage.value =
                    await getImage(context: context, pickFromCamera: true);
                // if (_pickedImage.value != null) {
                //   await _uploadImage(_pickedImage.value!);
                // }
              },
            );
          },
          child: ValueListenableBuilder(
            valueListenable: _pickedImage,
            builder: (context, pickImage, child) {
              return Stack(
                children: [
                  CircleAvatar(
                    radius: context.getHeight(0.14) / 2,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          )),
                      width: context.getHeight(0.2),
                      height: context.getHeight(0.2),
                      child: (_pickedImage.value ?? File('')).path.isNotEmpty
                          ? ClipOval(
                              child: Image.file(
                                (_pickedImage.value ?? File('')),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              icProfile,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Image.asset(icEdit),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
