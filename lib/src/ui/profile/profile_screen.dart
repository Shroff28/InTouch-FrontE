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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    locator<NavigationUtils>().push(routeProfile);
                  },
                  icon: Image.asset(
                    icProfileIcon,
                    height: context.getHeight(0.15) / 1.5,
                    width: context.getHeight(0.15) / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
                const ThemeText(
                  text: "User Name",
                  lightTextColor: primaryColor,
                  fontSize: fontSize20,
                ),
              ],
            ),
          ),
          _getListTile(onPressed: () {}, title: "Security"),
          _getListTile(onPressed: () {
            
          }, title: "Subscription Plan"),
          _getListTile(
              onPressed: () {
                locator<NavigationUtils>().pushAndRemoveUntil(routeLogin);
              },
              title: "Sign Out"),
        ],
      ),
    ).appBarScaffold(
      context: context,
      title: Localization.of().profile,
      isFilter: false,
    );
  }

  Widget _getListTile({required Function() onPressed, required String title}) {
    return ListTile(
      leading: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          icProfileIcon,
          height: context.getHeight(0.1) / 2,
          width: context.getHeight(0.1) / 2,
          fit: BoxFit.cover,
        ),
      ),
      title: ThemeText(
        text: title,
        lightTextColor: primaryColor,
        fontSize: fontSize16,
        fontWeight: fontWeightSemiBold,
      ),
    );
  }
}
