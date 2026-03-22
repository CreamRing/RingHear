import 'package:flutter/material.dart';

class StartPractice extends StatefulWidget {
  const StartPractice({ Key? key }) : super(key: key);

  @override
  State<StartPractice> createState() => _StartPracticeState();
}

class _StartPracticeState extends State<StartPractice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: SizedBox.expand(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(BeveledRectangleBorder())
                ),
                label: Text("性质听辨", textScaler: TextScaler.linear(2),),
                icon: Icon(Icons.propane, size: 96,),
                onPressed: () {

                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(BeveledRectangleBorder())
                ),
                label: Text("音高听辨", textScaler: TextScaler.linear(2),),
                icon: Icon(Icons.music_note_rounded, size: 96,),
                onPressed: () {

                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
