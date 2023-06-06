import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SnackbarGenerator {
  BuildContext context;

  SnackbarGenerator(this.context);
  snackBarGeneratorLogin() {
    final snackBar = SnackBar(

      content: const Text(
        "Please Login/Register Your Account",
        style: TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  snackBarGeneratorToast(String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
