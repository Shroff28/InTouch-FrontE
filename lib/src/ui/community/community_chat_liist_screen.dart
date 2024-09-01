import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/widgets/call_list.dart';
import 'package:flutter_boilerplate/src/widgets/search_text_field.dart';

class CommunityChatListScreen extends StatefulWidget {
  const CommunityChatListScreen({Key? key}) : super(key: key);

  @override
  State<CommunityChatListScreen> createState() =>
      _CommunityChatListScreenState();
}

class _CommunityChatListScreenState extends State<CommunityChatListScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  Timer? _debounce;

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
          _getVerticalListing(),
        ],
      ),
    ).appBarScaffold(
      context: context,
      title: "Community Chats",
      isFilter: false,
    );
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
}
