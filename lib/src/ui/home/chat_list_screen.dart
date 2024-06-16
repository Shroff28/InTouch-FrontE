import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ThemeText(
        text: "Chat List Screen",
        lightTextColor: primaryTextColor,
        fontSize: fontSize18,
      ),
    ).homeContainerScaffold(context: context);
  }
}