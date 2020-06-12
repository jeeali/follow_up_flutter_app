import 'package:flutter/material.dart';

class PromotionsPage extends StatefulWidget {
  @override
  _PromotionsPageState createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {

  var list = [
    'Flower Bulbs',
    'Flower Seeds',
    'Machinery',
    'Fertilizers',
    'Seedlings',
    'Vegetables'
  ];
  var iconList = [
    Icons.lightbulb_outline,
    Icons.ac_unit,
    Icons.tv,
    Icons.battery_charging_full,
    Icons.whatshot,
    Icons.filter_vintage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 2, right: 2),
        child: GridView.builder(
          itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8))),
                  elevation: 8,
                  child: InkWell(
                    onTap: () {
                      _onGridBtnClick(index);
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Color(0xFF66BB6A),
                                child: Icon(
                                  this.iconList[index],
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  bottom: 10, top: 10),
                            ),
                            Text(
                              this.list[index],
                              style: TextStyle(
                                  fontFamily: 'Raleway'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }

  void _onGridBtnClick(int index) {
    switch(index){
      case 0:
        Navigator.pushNamed(context, '/addCalls');
        break;
      case 1:
        Navigator.pushNamed(context, '/customerHistory');
        break;
      case 2:
        Navigator.pushNamed(context, '/addCustomer');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/promotions');
        break;
      case 5:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }
}
