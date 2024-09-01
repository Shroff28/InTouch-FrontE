import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/common_methods.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/search_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class CreateGroupChat extends StatefulWidget {
  const CreateGroupChat({Key? key}) : super(key: key);

  @override
  State<CreateGroupChat> createState() => _CreateGroupChatState();
}

class _CreateGroupChatState extends State<CreateGroupChat> {
  final _groupNameController = TextEditingController();
  final _groupNameFocus = FocusNode();
  final _searchFocus = FocusNode();
  Timer? _debounce;
  final _searchController = TextEditingController();
  final _pickedImage = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(height: context.getHeight(0.02)),
          _groupImage(),
          SizedBox(height: context.getHeight(0.02)),
          _groupName(),
          _searchTextField(),
          const Spacer(),
          _createButton(),
        ],
      ),
    ).appBarScaffold(
      context: context,
      title: 'Create Group',
      isFilter: false,
    );
  }

  Widget _groupImage() {
    return ValueListenableBuilder(
      valueListenable: _pickedImage,
      builder: (context, File? pickImage, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth(0.35),
            ),
            Column(
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
                        _pickedImage.value = await getImage(
                          context: context,
                          pickFromCamera: false,
                        );
                      },
                      onCameraClick: () async {
                        _pickedImage.value = await getImage(
                            context: context, pickFromCamera: true);
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: context.getHeight(0.14) / 2,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      width: context.getHeight(0.2),
                      height: context.getHeight(0.2),
                      child: (pickImage != null && pickImage.path.isNotEmpty)
                          ? ClipOval(
                              child: Image.file(
                                pickImage,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CircleAvatar(
                              radius: context.getHeight(0.14) / 2,
                              backgroundColor: Colors.grey,
                              child: const Icon(
                                Icons.group,
                                color: whiteColor,
                                size: 50,
                              ),
                            ),
                    ),
                  ),
                ),
                const ThemeText(
                  text: "Upload Image",
                  lightTextColor: blackColor,
                  fontSize: fontSize16,
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _groupName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: IgnorePointer(
        ignoring: false,
        child: PrimaryTextField(
          hint: 'Group Name',
          // textColor: whiteColor,
          // fillColor: secondaryColor,
          // borderColor: borderColor,
          // textCapitalization: TextCapitalization.sentences,
          // hintColor: hintColor,
          focusNode: _groupNameFocus,
          type: TextInputType.streetAddress,
          textInputAction: TextInputAction.done,
          controller: _groupNameController,
          onFieldSubmitted: (value) {
            final trimmedValue = value.trim();
            _groupNameController.text = trimmedValue;
            _groupNameFocus.unfocus();
          },
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SearchTextField(
        hint: Localization.of().search,
        focusNode: _searchFocus,
        type: TextInputType.name,
        textInputAction: TextInputAction.done,
        controller: _searchController,
        textColor: blackColor,
        fillColor: whiteColor,
        borderColor: borderColor,
        hintColor: primaryColor,
        prefixIcon: Icons.search,
        textCapitalization: TextCapitalization.sentences,
        onChanged: _onTextChanged,
      ),
    );
  }

  void _onTextChanged(String text) {
    if (text.isNotEmpty) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        // _getAllContactListApiCall(text, 1);
      });
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      // _getAllContactListApiCall("", 1);
    }
  }

  Widget _createButton() {
    return PrimaryButton(
        buttonText: 'CREATE',
        buttonColor: primaryColor,
        onButtonClick: () async {
          locator<NavigationUtils>().pop();
          // String? groupName = _groupNameController.text.trim();
          // if (groupName.isEmpty) {
          //   groupName = null; // Set groupName to null if it's empty
          // }
          // if (widget.isUpdate) {
          //   if (_selectedContacts.isEmpty) {
          //     showAlertDialog(message: 'Please Select Members');
          //   } else {
          //     FormData formData = FormData();
          //     formData.fields
          //         .add(MapEntry('name', _groupNameController.text.trim()));
          //     formData.fields
          //         .add(MapEntry('groupId', (widget.id ?? 0).toString()));

          //     await _updateGroupChatapicall(formData).then((value) {
          //       Provider.of<BottomTabBarProvider>(
          //               locator<NavigationUtils>().getCurrentContext,
          //               listen: false)
          //           .setIndex(1);
          //       locator<NavigationUtils>().pushAndRemoveUntil(routeTabbar);
          //     });
          //   }
          // } else {
          //   if (_selectedContacts.isEmpty) {
          //     showAlertDialog(message: 'Please Select Members');
          //   } else {
          //     FormData formData = FormData();
          //     formData.fields.add(MapEntry('name', _groupNameController.text));
          //     if (_pickedImage.value != null) {
          //       final image = MapEntry(
          //         mediaFile,
          //         await MultipartFile.fromFile(
          //           _pickedImage.value!.path,
          //           contentType:
          //               getImageContentType(filePath: _pickedImage.value!.path),
          //         ),
          //       );

          //       formData.files.add(image);
          //     }
          //     await _createGroupApiCall(formData).then(
          //       (value) => _addGroupMemberApiCall().then(
          //         (value) => locator<NavigationUtils>()
          //             .pushReplacement(routeGroupChat, arguments: {
          //           paramImage: _groupDp ?? '',
          //           paramId: _groupId ?? 0,
          //           paramName: _name ?? '',
          //         }),
          //       ),
          //     );
          //   }
          // }
        });
  }
}
