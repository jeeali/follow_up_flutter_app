import 'package:flutter/material.dart';

class CustomerHistoryPage extends StatefulWidget {
  @override
  _CustomerHistoryPageState createState() => _CustomerHistoryPageState();
}

class _CustomerHistoryPageState extends State<CustomerHistoryPage> {

  bool type = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer History'),
      ),
      body: Stack(
        children: <Widget>[
          type ? Container(
            child: DataTable(
              sortAscending: true,
              columns: [
                DataColumn(label: Text('Ticket')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Purpose')),
                DataColumn(label: Text('Agent')),
                DataColumn(label: Text('Medium')),
                DataColumn(label: Text('In/Out')),
                DataColumn(label: Text('Status')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1123')),
                  DataCell(Text('20-02-2020')),
                  DataCell(Text('Sales')),
                  DataCell(Text('Shahid')),
                  DataCell(Text('Mobile')),
                  DataCell(Text('Out')),
                  DataCell(Text('Contacting')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1123')),
                  DataCell(Text('20-02-2020')),
                  DataCell(Text('Sales')),
                  DataCell(Text('Shahid')),
                  DataCell(Text('Mobile')),
                  DataCell(Text('Out')),
                  DataCell(Text('Contacting')),
                ]),
              ],

            ),
          )
          : Container(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8))),
                    elevation: 8,
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Ticket 1223', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('20-02-2020', style: TextStyle(
                              color: Colors.grey
                          ),),
                          Text('Sales', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('Shahid', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),),
                          Text('Mobile',),
                          Text('Type: Out'),
                          Text('Status: Contract'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8))),
                    elevation: 8,
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Ticket 1223', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('20-02-2020', style: TextStyle(
                              color: Colors.grey
                          ),),
                          Text('Sales', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('Shahid', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),),
                          Text('Mobile',),
                          Text('Type: Out'),
                          Text('Status: Contract'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: RaisedButton(
                padding: EdgeInsets.only(left: 40, right: 40),
                color: Colors.green,
                onPressed: (){
                  if(type){
                    setState(() => type = false);
                  } else{
                    setState(() => type = true);
                  }
                },
                child: Text('NEXT', style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
