import 'package:flutter/material.dart';
import 'package:ring_hear/intervalProperty/interval_property_setting_page.dart';

enum PageID {
  intervalProperty,
  chordProperty,
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void gotoPage(PageID pageID) {
    switch (pageID) {
      case PageID.intervalProperty:
        Navigator.push(context, MaterialPageRoute(builder: (context) => IntervalPropertySettingPage()));
        break;
      case PageID.chordProperty:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ChordHarmonyPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("圈圈练耳"),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => gotoPage(PageID.intervalProperty),
                    child: Text("和声音程")
                  )
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => gotoPage(PageID.chordProperty),
                    child: Text("和声和弦")
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
