import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/screens/home/home_screen.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList.elementAt(pageIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.black38, width: 0.2))),
          child: BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedLabelStyle: TextStyle(
                fontFamily: OkwFont.book, color: Colors.grey.withOpacity(0.2)),
            selectedLabelStyle: TextStyle(
                fontFamily: OkwFont.book, color: AppColors.primaryColor),
            iconSize: 20,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImage.home),
                  activeIcon: SvgPicture.asset(AppImage.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImage.bill),
                  activeIcon: SvgPicture.asset(AppImage.bill),
                  label: 'Transaction'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImage.card),
                  activeIcon: SvgPicture.asset(AppImage.card),
                  label: 'Card'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImage.setting),
                  activeIcon: SvgPicture.asset(AppImage.setting),
                  label: 'Settings'),
            ],
          ),
        ));
  }
}
