import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/svg.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final _fabButtonKey = GlobalKey<ExpandableFabState>();
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
                onPressed: () {},
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
      title: Localization.of().community,
      isFilter: false,
      floatingButton: ExpandableFab(
        distance: 70,
        key: _fabButtonKey,
        type: ExpandableFabType.up,
        overlayStyle: const ExpandableFabOverlayStyle(blur: 5),
        openButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {
              _fabButtonKey.currentState?.toggle();
              locator<NavigationUtils>().push(routeCreateGroup);
            },
            child: Image.asset(
              icChatting,
              height: 30,
            ),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {
              _fabButtonKey.currentState?.toggle();
              // locator<NavigationUtils>()
              //     .push(routeAddCase, arguments: {
              //   paramIsEdit: false,
              // });
            },
            child: const Icon(
              CupertinoIcons.add,
              size: 30,
            ),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {
              _fabButtonKey.currentState?.toggle();
              // locator<NavigationUtils>()
              //     .push(routeAddCase, arguments: {
              //   paramIsEdit: false,
              // });
            },
            child: const Icon(
              CupertinoIcons.search,
              size: 30,
            ),
          ),
        ],
      ),
      widget: GestureDetector(
        onTap: () {
          locator<NavigationUtils>().push(routeCommunityChatListing);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SvgPicture.asset(
            icChat,
            height: 30,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
