import 'package:mobile_app/home.dart';
import 'package:mobile_app/trivia.dart';
import 'package:mobile_app/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key,});

  @override
  DrawerMenuState createState() => DrawerMenuState();
}

class DrawerMenuState extends State<DrawerMenu> {
  final AdvancedDrawerController advancedDrawerController =
  AdvancedDrawerController();

  final PageController pageController = PageController();
  final List<Widget> pages = [const Home(), const Trivia(), const History()];
  final List<String> pageTitles = ['Home', 'Learn More About Black Sigatoka', 'History'];
  final List<IconData> pageIcons = [Icons.home_sharp, Icons.menu_book_sharp, Icons.history_sharp];
  int currentPageIndex = 0;

  void navigateToPage(int index) {
    advancedDrawerController.hideDrawer(); // Close the drawer without animation
    pageController.jumpToPage(index);
  }

  void toggleDrawer() {
    advancedDrawerController.toggleDrawer(); // Toggle the drawer with animation
  }

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return AdvancedDrawer(
      controller: advancedDrawerController,
      backdrop: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF21985F), Color(0xFF092A1A)],
          ),
        ),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 0.0.w,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16.w)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0.w,
                height: 128.0.w,
                margin: EdgeInsets.only(
                  top: 24.0.h,
                  bottom: 64.0.h,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/brand_logo.jpg',
                ),
              ),
              for (int index = 0; index < pageTitles.length; index++)
                InkWell(
                  onTap: () {
                    navigateToPage(index);
                  },
                  child: ListTile(
                    leading: Icon(
                      pageIcons[index],
                      size: 30.sp,
                    ),
                    title: Text(
                      pageTitles[index],
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20.sp,
                        fontWeight: currentPageIndex == index ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              ListTile(
                leading: Icon(Icons.exit_to_app, size: 30.sp),
                title: Text(
                  'EXIT',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Material(
            child: PageView(
              controller: pageController,
              children: pages,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
          Positioned(
            top: 35.h,
            left: 10.w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3F000000),
                    blurRadius: 5.w,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu_open, size: 30.sp),
                onPressed: toggleDrawer,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
