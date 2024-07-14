import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/widgets/call_list.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({Key? key}) : super(key: key);

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          _getVerticalListing(),
        ],
      ),
    ).appBarScaffold(context: context, title: "Audio Call Logs");
  }

  Widget _getVerticalListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => const CallList(
          color: redColor,
          icon: Icons.call_received,
          // : Icons.call_missed_outgoing_rounded,
          image: "",
          name: "Audio Calls",
          time: "12:00 PM",
          logType: "Incoming",
        ),
      ),
    );
  }
}
