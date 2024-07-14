import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/widgets/call_list.dart';
import 'package:flutter_boilerplate/src/widgets/search_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class FilterModel {
  final IconData icon;
  final String name;

  FilterModel({
    required this.icon,
    required this.name,
  });
}

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  Timer? _debounce;
  List<FilterModel> listOfFilters = [
    FilterModel(icon: Icons.heart_broken, name: "Heartbroken"),
    FilterModel(icon: Icons.people, name: "Family"),
    FilterModel(icon: Icons.breakfast_dining_outlined, name: "Food"),
    FilterModel(icon: Icons.monetization_on, name: "Money"),
    FilterModel(icon: Icons.monetization_on, name: "Money"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _searchTextField(),
          const SizedBox(height: 10),
          _getListOfFilter(),
          const SizedBox(height: 10),
          _getVerticalListing(),
        ],
      ),
    ).appBarScaffold(context: context, title: "Chat Logs");
  }

  Widget _getVerticalListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => const CallList(
          color: blackColor,
          // : Icons.call_missed_outgoing_rounded,
          image: "",
          name: "Chats",
          time: "12:00 PM",
          logType: "message",
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SearchTextField(
        hint: Localization.of().search,
        focusNode: _searchFocus,
        type: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: _searchController,
        textColor: themeColor,
        fillColor: whiteColor,
        borderColor: borderColor,
        hintColor: themeColor,
        prefixIcon: Icons.search,
        textCapitalization: TextCapitalization.sentences,
        onChanged: _onTextChanged,
      ),
    );
  }

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Provider.of<ChatListProvider>(context, listen: false).filterChats(text);
    });
  }

  Widget _getListOfFilter() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(50.0),
                  color: whiteColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 0.0),
                      child: Icon(
                        listOfFilters[index].icon,
                        size: 20,
                      ),
                    ),
                    ThemeText(
                      text: listOfFilters[index].name,
                      lightTextColor: primaryColor,
                      fontWeight: fontWeightSemiBold,
                      fontSize: fontSize12,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
