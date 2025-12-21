import 'package:flutter/material.dart';

class IntervalPropertySettingPage extends StatefulWidget {
  const IntervalPropertySettingPage({ Key? key }) : super(key: key);

  @override
  _IntervalPropertySettingPageState createState() => _IntervalPropertySettingPageState();
}

class _IntervalPropertySettingPageState extends State<IntervalPropertySettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("和声音程设置"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text("音程性质"),
            )
          ],
        ),
      ),
    );
  }
}
