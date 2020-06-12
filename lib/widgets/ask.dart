import 'package:flutter/material.dart';

class Ask{
  Future<bool> askAlert({
    @required String message,
    @required String yesAction,
    @required String noAction,
    @required BuildContext context,
    @required Function func,
  }) async {
    Widget continueButton = FlatButton(
      child: Text(yesAction),
      onPressed: () {
        Navigator.pop(context);
        func();
      },
    );
    Widget cancelButton = FlatButton(
      child: Text(noAction),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            title: Text(message),
            actions: <Widget>[
              cancelButton,
              continueButton,
            ],
          ),
    );
  }
}