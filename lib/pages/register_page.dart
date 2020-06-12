import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/circular_progress.dart';
import '../widgets/text_feild.dart';
import '../utils/colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<ScaffoldState> mScaffoldState =
  new GlobalKey<ScaffoldState>();
  double _btnSize = 315;
  double _btnBorder = 4;
  bool _isLoading = false;

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: mScaffoldState,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 150, bottom: 10, left: 20, right: 30),
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                ),
                CustomTextField(
                  label: 'Name',
                  controller: name,
                  isObsecure: false,
                  inputType: TextInputType.text,
                  topMargin: 40,
                  size: size,
                ),
                CustomTextField(
                  label: 'Email',
                  controller: email,
                  isObsecure: false,
                  inputType: TextInputType.emailAddress,
                  topMargin: 40,
                  size: size,
                ),
                CustomTextField(
                  label: 'Password',
                  controller: password,
                  isObsecure: true,
                  inputType: TextInputType.text,
                  topMargin: 40,
                  size: size,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    width: _btnSize,
                    height: 46,
                    margin: EdgeInsets.only(bottom: 96),
                    child: FlatButton(
                      onPressed: () => _check(),
                      color: _isLoading
                          ? AppColors.loadingButtonColor
                          : AppColors.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            _btnBorder)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: _isLoading ? CircularProgress() : Text(
                        "Register",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.accentText,
                          fontFamily: "",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already Member?',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        ' Login',
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _check(){
    if(!_isLoading){
      setState(() {
        _isLoading = true;
        _btnSize = 80;
        _btnBorder = 20;
      });
    } else{
      setState(() {
        _isLoading = false;
        _btnSize = 315;
        _btnBorder = 4;
      });
    }
  }

}
