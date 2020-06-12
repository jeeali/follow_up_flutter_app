import 'package:flutter/material.dart';
import 'package:follow_up_app/utils/colors.dart';

class InOutListItem extends StatelessWidget {

  final String title;

  const InOutListItem({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      color: AppColors.infoBlockColor2,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 6),
        child: Column(
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor
              ),
            ),
            Divider(
              indent: 50,
              endIndent: 50,
              color: AppColors.lightTextColor,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'OPEN',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor
                      ),
                    ),
                    Text(
                      'IN (1)',
                      style: TextStyle(
                          color: AppColors.textColor
                      ),
                    ),
                    Text(
                      'OUT (4)',
                      style: TextStyle(
                          color: AppColors.textColor
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'CLOSE',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.subText
                      ),
                    ),
                    Text(
                      'IN (1)',
                      style: TextStyle(
                          color: AppColors.subText
                      ),
                    ),
                    Text(
                      'OUT (4)',
                      style: TextStyle(
                          color: AppColors.subText
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
