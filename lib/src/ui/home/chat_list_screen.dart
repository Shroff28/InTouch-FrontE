import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/widgets/call_list.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: _getVerticalListing(),
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
}
