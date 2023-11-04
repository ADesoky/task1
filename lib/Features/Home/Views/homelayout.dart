import 'package:flutter/material.dart';
import 'package:task/Features/Home/Views/homescreen.dart';
import 'package:task/Features/Home/Views/tabs/profile.dart';
import 'package:task/Shared/app_colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: MyColors.redColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset_sharp),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedindex,
        onTap: (index) {
          changeIndex(index);
        },

      ),
      body :screens[selectedindex]
    );
  }

  int selectedindex = 0;

  changeIndex(index) {
    setState(() {
      selectedindex = index;
    });
  }
  List<Widget> screens = [HomeScreen(),Profile(),HomeScreen(),Profile()];
}
