import 'package:flutter/material.dart';

class RestartAppWidget extends StatefulWidget {
  RestartAppWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppWidgetState>()!.restartApp();
  }

  @override
  _RestartAppWidgetState createState() => _RestartAppWidgetState();
}

class _RestartAppWidgetState extends State<RestartAppWidget> {
  bool restarting = false;

  void restartApp() async {
    restarting = true;   // restart variable is set to true
    setState(() {});
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      setState(() {
        restarting = false; //restart variable is set to false
      });
    });
    // setState(() {
    //   key = UniqueKey();
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (restarting) {
      return SizedBox();   //an empty Sizedbox is displayed for 300 milliseconds you can add a loader if you want
    }
    return SizedBox(
      child: widget.child,
    );
  }
}