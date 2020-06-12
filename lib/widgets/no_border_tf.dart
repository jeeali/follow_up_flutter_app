import 'package:flutter/material.dart';
import '../utils/colors.dart';

class NoBorderTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isObsecure;
  final double topMargin;
  final TextInputType inputType;
  final Size size;
  final bool readOnly;

  const NoBorderTextField(
      {Key key,
        @required this.label,
        @required this.controller,
        @required this.isObsecure,
        @required this.inputType,
        @required this.topMargin,
        @required this.size,
        this.readOnly})
      : super(key: key);

  noFunc() {
    debugPrint('No Func');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
      margin: EdgeInsets.only(top: topMargin),
      child: TextField(
        readOnly: readOnly == null ? false : readOnly,
        obscureText: isObsecure,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration.collapsed(
          hintText: label
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 1,
        autocorrect: false,
      ),
    );
  }
}
