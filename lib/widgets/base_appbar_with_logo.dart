import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseAppnbar {
  final String _title ;
  final BuildContext context;
  BaseAppnbar(this.context, this._title);
  AppBar createBaseAppbar() {
    return
      AppBar(
        elevation: 5,
        shadowColor: Colors.grey.shade400,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

    );
  }
}
