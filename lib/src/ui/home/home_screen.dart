import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/widgets/call_list.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // locator<NavigationUtils>().push(routeProfile);
                  },
                  icon: Image.asset(
                    imgApplogo,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // locator<NavigationUtils>().push(routeProfile);
                  },
                  icon: Image.asset(
                    icProfileIcon,
                    height: context.getHeight(0.15) / 2,
                    width: context.getHeight(0.15) / 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ThemeText(
              text: "Top Experts",
              lightTextColor: primaryTextColor,
              fontSize: fontSize24,
              fontWeight: fontWeightBold,
            ),
          ),
          _getHorizontalListing(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ThemeText(
              text: "Top Articles for you",
              lightTextColor: primaryTextColor,
              fontSize: fontSize24,
              fontWeight: fontWeightBold,
            ),
          ),
          _getVerticalListing(),
        ],
      ),
    ).homeContainerScaffold(context: context);
  }

  Widget _getHorizontalListing() {
    return SizedBox(
      height: context.getHeight(0.25),
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => getContainer(),
      ),
    );
  }

  Widget getContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.getWidth(0.4),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey[300]!,
              Colors.blueGrey[400]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  color: primaryColor,
                ),
                width: 175,
                height: 100,
              ),
            ),
            Positioned(
              right: 0,
              top: 10,
              bottom: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  _getImageWidget(),
                  const Text(
                    "title",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "subtitle",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImageWidget() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 100,
      height: 100,
      child: Image.asset(
        icProfile,
        width: double.infinity,
        height: double.infinity,
      ),
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
          // icon: Icons.call_received,
          // : Icons.call_missed_outgoing_rounded,
          image: "",
          name: "Article",
          time: "",
          logType: "Recommended for you",
        ),
      ),
    );
  }
}
