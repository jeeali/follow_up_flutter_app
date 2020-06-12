import 'package:flutter/material.dart';
import 'package:follow_up_app/utils/colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Icon(Icons.image, color: Colors.white, size: 160),
            ),
            _btn(title: 'Sign In', pad: 100, ),
            _btn(title: 'Create New Account', pad: 58),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('Learn more about follow-up', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  Widget _btn({String title, double pad}){
    return RaisedButton(
      padding: EdgeInsets.only(left: pad, right: pad, top: 12, bottom: 12),
      onPressed: (){},
      child: Text(title, style: TextStyle(color: Colors.white),),
      color: Color(0x42000000),
      elevation: 0,
    );
  }
}
