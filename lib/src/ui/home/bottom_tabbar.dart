import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/providers/bottom_tab_provider.dart';
import 'package:flutter_boilerplate/src/ui/home/audio_call_screen.dart';
import 'package:flutter_boilerplate/src/ui/home/chat_list_screen.dart';
import 'package:flutter_boilerplate/src/ui/home/community_screen.dart';
import 'package:flutter_boilerplate/src/ui/home/home_screen.dart';
import 'package:flutter_boilerplate/src/ui/home/video_call_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({Key? key}) : super(key: key);

  @override
  State<BottomTabbar> createState() => _BottomTabbarState();
}

class _BottomTabbarState extends State<BottomTabbar> {
  final List<Widget> _screens = [
    const ChatListScreen(),
    const AudioCallScreen(),
    const HomeScreen(),
    const VideoCallScreen(),
    const CommunityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomTabBarProvider>(
      builder: (context, bottomTab, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: _screens[bottomTab.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomTab.currentIndex,
            onTap: (int index) {
              bottomTab.setIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  icChat,
                  height: 30,
                  color: bottomTab.currentIndex == 0
                      ? primaryColor
                      : tabBackgroundColor,
                  width: 30,
                ),
                label: Localization.of().chat,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  icCall,
                  height: 30,
                  width: 30,
                  color: bottomTab.currentIndex == 1
                      ? primaryColor
                      : tabBackgroundColor,
                ),
                label: Localization.of().audio,
              ),
              BottomNavigationBarItem(
                icon: Container(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  icVideo,
                  color: bottomTab.currentIndex == 3
                      ? primaryColor
                      : tabBackgroundColor,
                  height: 30,
                  width: 30,
                ),
                label: Localization.of().video,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  icPeople,
                  color: bottomTab.currentIndex == 4
                      ? primaryColor
                      : tabBackgroundColor,
                  height: 30,
                  width: 30,
                ),
                label: Localization.of().community,
              ),
            ],
            selectedItemColor: primaryColor,
            unselectedItemColor: tabBackgroundColor,
            selectedFontSize: fontSize14,
            unselectedFontSize: fontSize14,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 24),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 10,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            alignment: Alignment.bottomCenter,
            height: 130,
            width: 300,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: whiteColor,
              ),
              child: ClipOval(
                child: FloatingActionButton(
                  onPressed: () {
                    bottomTab.setIndex(2);
                  },
                  elevation: 0,
                  backgroundColor: whiteColor,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: bottomTab.currentIndex == 2
                            ? primaryColor
                            : tabBackgroundColor,
                        width: 4,
                      ),
                    ),
                    child: Image.asset(
                      icHome,
                      width: 40,
                      alignment: Alignment.topCenter,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
