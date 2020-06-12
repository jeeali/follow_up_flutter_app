import 'package:flutter/material.dart';
import 'package:follow_up_app/models/customer.dart';
import 'package:follow_up_app/pages/add_calls_page.dart';
import 'package:follow_up_app/utils/colors.dart';
import 'package:follow_up_app/widgets/bottom_buttons.dart';
import 'package:follow_up_app/widgets/in_out_list_item.dart';

Customer _selectedCustomer;

class Step1 extends StatefulWidget {

  final Size size;
  final Function onChangeDropDown;
  final Function decreaseStackIndex;
  final Function increaseStackIndex;

  const Step1({
    Key key,
    @required this.size,
    @required this.onChangeDropDown,
    @required this.decreaseStackIndex,
    @required this.increaseStackIndex}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {

  @override
  void initState() {
    _selectedCustomer = AddCallsPage.customersSampleList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Agents Involved',
                  style: TextStyle(
                      color: AppColors.infoBlockTextColor2
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Text('A'),
                            ),
                            label: Text('Aaron Burr'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Text('Z'),
                            ),
                            label: Text('Zain Shahid'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Text('T'),
                            ),
                            label: Text('Tahir'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Text('A'),
                            ),
                            label: Text('Alex'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Select Customer',
                  style: TextStyle(
                      color: AppColors.infoBlockTextColor2
                  ),
                ),
                DropdownButton(
                  isExpanded: true,
                  items: AddCallsPage.dropDownMenuItem,
                  value: _selectedCustomer,
                  onChanged: onChangeDropDownItem,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Last Activity (25-Jan-2020 12:30:00)',
                    style: TextStyle(
                        color: AppColors.lightTextColor
                    ),
                  ),
                ),
                Container(
                  width: widget.size.width,
                  height: 60,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: widget.size.width/2.5,
                        decoration: BoxDecoration(
                          color: AppColors.infoBlockColor1,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                            ),
                        ),
                        child: Center(
                          child: Text(
                            'Open Ticket Number',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                color: AppColors.infoBlockTextColor1
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: widget.size.width/2.5,
                        decoration: BoxDecoration(
                          color: AppColors.infoBlockColor2,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            )
                        ),
                        child: Center(
                          child: Text(
                            '102536',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.infoBlockTextColor2,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 46),
                    child: ListView(
                      children: <Widget>[
                        InOutListItem(title: 'sales'),
                        InOutListItem(title: 'complaint'),
                        InOutListItem(title: 'promotion'),
                        InOutListItem(title: 'recieveables'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            BottomButtons(
              decreaseStackIndex: widget.decreaseStackIndex,
              increaseStackIndex: widget.increaseStackIndex,
              size: widget.size,
            )
          ],
        ),
      ),
    );
  }

  onChangeDropDownItem(Customer value){
    setState(() => _selectedCustomer = value);
    widget.onChangeDropDown(value);
    debugPrint('I am changed');
  }
}
