import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  // locator<NavigationUtils>().push(routeProfile);
                },
                icon: Image.asset(
                  icProfileIcon,
                  height: context.getHeight(0.1) / 2,
                  width: context.getHeight(0.1) / 2,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ThemeText(
                    text: "Community Screen",
                    lightTextColor: primaryTextColor,
                    fontSize: fontSize18,
                    fontWeight: fontWeightSemiBold,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.7,
                          color: primaryColor,
                          offset: Offset(0.5, 0.7),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      // border: Border.all(
                      //   // color: primaryColor,
                      //   width: 1,
                      // ),
                    ),
                    width: context.getWidth(0.8),
                    child: const ThemeText(
                      text:
                          "nkoaviuefrhubiuafncagugiaiuinsoidngoifnfsoiidfnoiwugnoiunosdnfounvosfunvouWEGIUVHAIUHIUuisdhiuviusfuG34IUYGUIiufuisbhuibniudouvbbuisbiuwbiuvbiu9ejgufshgnrouihncu3gqbiaoihgnorroaurhg8owrhiopuhnouisdhoufbusoifbuisfhuiuongr78pgr7pgrp7a9hgo87sg8o7cvw3bg7gcjaprgo8gyp9wyg8oqgp7hgprhg7-q9ephcg7g3hry8wrhgo87qwhrgo87hq7go8o8egh",
                      lightTextColor: primaryColor,
                      fontSize: fontSize13,
                      fontWeight: fontWeightMedium,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    ).appBarScaffold(
      context: context,
      title: "Community",
      isFilter: false,
      widget: PopupMenuButton(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: ((context) {
            return [
              PopupMenuItem(
                onTap: () {},
                child: const ThemeText(
                  text: "Post",
                  fontSize: fontSize13,
                  lightTextColor: primaryColor,
                ),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const ThemeText(
                  text: "Groups",
                  fontSize: fontSize13,
                  lightTextColor: primaryColor,
                ),
              )
            ];
          }),
          child: const Icon(
            Icons.more_vert,
            size: 30,
          )),
      // IconButton(
      //   onPressed: () {},
      //   icon: const Icon(
      //     Icons.more_vert,
      //     size: 30,
      //   ),
      // ),
    );
  }
}
