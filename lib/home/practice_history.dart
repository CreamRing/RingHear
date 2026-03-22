import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeHistory extends StatefulWidget {
  const PracticeHistory({ Key? key }) : super(key: key);

  @override
  State<PracticeHistory> createState() => _PracticeHistoryState();
}

class _PracticeHistoryState extends State<PracticeHistory> {
  List<Text> _histories = [];

  @override
  void initState() {
    super.initState();
    _loadStorage();
  }

  Future<void> _loadStorage() async {
    var prefs = await SharedPreferences.getInstance();

    var histories = prefs.getStringList("history");

    List<Text> newHistories = [];

    if (histories != null) {
      // --- 修改开始：倒序循环 ---
      // 从最后一个索引 (histories.length - 1) 开始，直到 0
      for (int i = histories.length - 1; i >= 0; i--) {
        newHistories.add(Text(histories[i]));
      }
      // --- 修改结束 ---
    }

    // --- 重要修复：必须使用 setState 通知 UI 更新 ---
    setState(() {
      _histories = newHistories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _histories
    );
  }
}
