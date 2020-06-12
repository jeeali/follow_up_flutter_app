import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(AppColors.loadingColor),
      ),
    );
  }
}
