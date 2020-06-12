import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {

  var list = [
    'Total Communications',
    'Active Sales Leads',
    'No. of Companies',
    'Today\'s Follow-Up',
    'Agent\'s Report',
    'Customer\'s Timeline'
  ];
  var iconList = [
    Icons.call,
    Icons.person,
    Icons.person_add,
    Icons.trending_up,
    Icons.whatshot,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 2, right: 2),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Card(
                color: Color(0xFF66BB6A),
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8))),
                elevation: 8,
                child: InkWell(
                  onTap: () {
//                    _onGridBtnClick(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        this.list[index],
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontSize: 18,
//                          fontWeight: FontWeight.bold
                        ),
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
}
