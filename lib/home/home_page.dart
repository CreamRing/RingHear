import 'package:flutter/material.dart';
import 'package:ring_hear/home/practice_history.dart';
import 'package:ring_hear/home/start_practice.dart';

enum PageID {
  intervalProperty,
  chordProperty,
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 所有页面的导航项
  final List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.music_note_sharp),
      label: "开始练习",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: "练习记录",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: "偏好设定",
    ),
  ];
  //当前导航项
  int _currentIndex = 0;
  //页面导航控制器
  PageController pageController = PageController();

  //页面设计
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: const Text("圈圈练耳"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.transparent,
        items: navigationItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            var duration =  Duration(milliseconds: 250);
            pageController.animateToPage(value, duration: duration, curve: Curves.easeInOutCirc);
          });
        },
      ),
      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                StartPractice(),
                PracticeHistory(),
                StartPractice()
              ],
            ),
          )
        ],
      ),
    );
  }
}
