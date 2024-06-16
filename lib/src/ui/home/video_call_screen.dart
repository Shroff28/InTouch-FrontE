import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ThemeText(
        text: "Video Call Screen",
        lightTextColor: primaryTextColor,
        fontSize: fontSize18,
      ),
    ).homeContainerScaffold(context: context);
  }
}
