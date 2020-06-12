import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {

  final Function decreaseStackIndex;
  final Function increaseStackIndex;
  final Size size;

  const BottomButtons({Key key,
    @required this.decreaseStackIndex,
    @required this.increaseStackIndex,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: decreaseStackIndex,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  )
                ),
                color: Colors.red,
                child: Container(
                  height: 44,
                  width: size.width/2.4,
                  child: Center(
                    child: Text(
                      'BACK',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: increaseStackIndex,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                ),
                color: Colors.green,
                child: Container(
                  height: 44,
                  width: size.width/2.4,
                  child: Center(
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
