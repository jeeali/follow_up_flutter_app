import 'package:flutter/material.dart';
import '../utils/colors.dart';

class OnTapCustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isObsecure;
  final double topMargin;
  final TextInputType inputType;
  final Size size;
  final bool readOnly;
  final Function onTap;

  const OnTapCustomTextField(
      {Key key,
      @required this.label,
      @required this.controller,
      @required this.isObsecure,
      @required this.inputType,
      @required this.topMargin,
      @required this.size,
      @required this.onTap,
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
        onTap: onTap,
        readOnly: readOnly == null ? false : readOnly,
        obscureText: isObsecure,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.all(0),
        ),
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
