import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/widgets/shimmer_widget.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class CallList extends StatefulWidget {
  final String name;
  final String time;
  final String logType;
  final IconData? icon;
  final Color color;
  final String image;

  const CallList({
    Key? key,
    required this.name,
    required this.image,
    required this.time,
    required this.logType,
    this.icon,
    required this.color,
  }) : super(key: key);

  @override
  State<CallList> createState() => _CallListState();
}

class _CallListState extends State<CallList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: context.getHeight(0.065),
                  width: context.getHeight(0.065),
                  child: widget.image.isNotEmpty
                      ? ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: widget.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorWidget: (context, url, error) => Container(),
                            placeholder: (context, url) =>
                                const ShimmerWidget(),
                          ),
                        )
                      : defaultUserProfile(context.getHeight(0.1))),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ThemeText(
                      text: widget.name,
                      lightTextColor: blackColor,
                      fontSize: fontSize20,
                      fontWeight: fontWeightMedium,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ThemeText(
                        text: widget.time,
                        lightTextColor: Colors.grey,
                        fontSize: fontSize14,
                        fontWeight: fontWeightMedium,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ThemeText(
                      text: widget.logType,
                      lightTextColor: widget.color,
                      fontSize: fontSize14,
                      fontWeight: fontWeightSemiBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultUserProfile(context, {double iconSize = 37}) {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        height: context,
        width: context,
        child: Icon(
          Icons.person,
          color: whiteColor,
          size: iconSize,
        ),
      ),
    );
  }
}
