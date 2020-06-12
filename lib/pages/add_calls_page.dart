import 'package:flutter/material.dart';
import 'package:follow_up_app/models/customer.dart';
import 'package:follow_up_app/utils/colors.dart';
import 'package:follow_up_app/widgets/ask.dart';
import 'package:follow_up_app/widgets/bottom_buttons.dart';
import 'package:follow_up_app/widgets/no_border_tf.dart';
import 'package:follow_up_app/widgets/step_1.dart';
import 'package:follow_up_app/widgets/step_2.dart';

//  Stack 1
List<DropdownMenuItem<Customer>> _dropDownMenuItem;
List<Customer> _customersSampleList = [
  Customer('Ali'),
  Customer('Aliza'),
  Customer('Osama'),
];
Customer _selectedCustomer;

//  Stack 2
List<String> _purposeList = [
  "Promotion",
  "New Sales",
  "Sales Follow Up",
  "Complaints",
  "Recieveables"
];
List<String> _productsList = [
  "Flower Seeds",
  "Flower Bulbs",
  "Fertilizers",
  "Services",
  "Other"
];

class AddCallsPage extends StatefulWidget {

  static get dropDownMenuItem => _dropDownMenuItem;
  static get customersSampleList => _customersSampleList;
  static get selectedCustomer => _selectedCustomer;

  static get purposeList => _purposeList;
  static get productsList => _productsList;

  @override
  _AddCallsPageState createState() => _AddCallsPageState();
}

class _AddCallsPageState extends State<AddCallsPage> {

  int _stepIndex = 0;
  bool _isIn = false;
  bool _isCallRecorded = false;

//  Stack 2
  List<String> _selectedPurposeList = List();
  List<String> _selectedProductsList = List();

//  Stack 3
  String _date = 'Tap to Select Date';
  String _time = 'Tap to Select Time';

  @override
  void initState() {
    _dropDownMenuItem = buildDropDownMenItems(_customersSampleList);
    setState(() => _selectedCustomer = _dropDownMenuItem[0].value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _askAlertWill,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add Call'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Step ${_stepIndex + 1} of 6'),),
            )
          ],
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(child: child, scale: animation),
          child: IndexedStack(
            key: ValueKey<int>(_stepIndex),
            index: _stepIndex,
            children: <Widget>[
              Step1(
                size: _size,
                onChangeDropDown: onChangeDropDownItem,
                decreaseStackIndex: _decreaseStackIndex,
                increaseStackIndex: _increaseStackIndex,
              ),
              Step2(
                size: _size,
                increaseStackIndex: _increaseStackIndex,
                decreaseStackIndex: _decreaseStackIndex,
                onProductSelectCallback: _onProductSelectCallback,
                onPurposeSelectCallback: _onPurposeSelectCallback,
              ),
              _step3(size: _size),
              _step4(size: _size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _step3({Size size}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 48),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Medium',
                      style: TextStyle(
                          color: AppColors.infoBlockTextColor2
                      ),
                    ),
                    DropdownButton(
                      isExpanded: true,
                      items: _dropDownMenuItem,
                      value: _selectedCustomer,
                      onChanged: onChangeDropDownItem,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.calendar_today,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Date',
                            style: TextStyle(
                                color: AppColors.textColor
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => _pickDate(),
                        child: Container(
                          width: size.width/1.2,
                          height: 50,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: _date == 'Tap to Select Date' ?
                            AppColors.infoBlockColor2 :
                            AppColors.infoBlockColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              _date,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: _date == 'Tap to Select Date' ? TextStyle(
                                  color: AppColors.infoBlockTextColor2,
                                  fontSize: 18
                              ) : TextStyle(
                                  color: AppColors.infoBlockTextColor1,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.access_time,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Time',
                            style: TextStyle(
                                color: AppColors.textColor
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => _pickTime(),
                        child: Container(
                          width: size.width/1.2,
                          height: 50,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: _time == 'Tap to Select Time' ?
                            AppColors.infoBlockColor2 :
                            AppColors.infoBlockColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              _time,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: _time == 'Tap to Select Time' ? TextStyle(
                                  color: AppColors.infoBlockTextColor2,
                                  fontSize: 18
                              ) : TextStyle(
                                  color: AppColors.infoBlockTextColor1,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.compare_arrows,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'In / Out',
                            style: TextStyle(
                              color: AppColors.textColor
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 50,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: _inTap,
                            child: Container(
                              width: size.width/2.3,
                              decoration: BoxDecoration(
                                color: _isIn ? AppColors.infoBlockColor1 : AppColors.infoBlockColor2,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  ),
                              ),
                              child: Center(
                                child: Text(
                                  'IN',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: _isIn ? TextStyle(
                                    color: AppColors.infoBlockTextColor1,
                                    fontSize: 18
                                  ) : TextStyle(
                                    color: AppColors.infoBlockTextColor2,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _outTap,
                            child: Container(
                              width: size.width/2.3,
                              decoration: BoxDecoration(
                                color: _isIn ? AppColors.infoBlockColor2 : AppColors.infoBlockColor1,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                              ),
                              child: Center(
                                child: Text(
                                  'OUT',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: _isIn ? TextStyle(
                                    color: AppColors.infoBlockTextColor2,
                                      fontSize: 18
                                  ) : TextStyle(
                                    color: AppColors.infoBlockTextColor1,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.phone,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Call Record',
                            style: TextStyle(
                                color: AppColors.textColor
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 50,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: _callYesTap,
                            child: Container(
                              width: size.width/2.3,
                              decoration: BoxDecoration(
                                color: _isCallRecorded ? AppColors.infoBlockColor1 : AppColors.infoBlockColor2,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  'YES',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: _isCallRecorded ? TextStyle(
                                      color: AppColors.infoBlockTextColor1,
                                      fontSize: 18
                                  ) : TextStyle(
                                      color: AppColors.infoBlockTextColor2,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _callNoTap,
                            child: Container(
                              width: size.width/2.3,
                              decoration: BoxDecoration(
                                color: _isCallRecorded ? AppColors.infoBlockColor2 : AppColors.infoBlockColor1,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                )
                              ),
                              child: Center(
                                child: Text(
                                  'NO',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: _isCallRecorded ? TextStyle(
                                      color: AppColors.infoBlockTextColor2,
                                      fontSize: 18
                                  ) : TextStyle(
                                      color: AppColors.infoBlockTextColor1,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _isCallRecorded ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.attach_file,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Attach Recording',
                            style: TextStyle(
                                color: AppColors.textColor
                            ),
                          )
                        ],
                      ),
                    ) : Container(),
                    _isCallRecorded ? Center(
                      child: Container(
                        width: size.width/1.2,
                        height: 50,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColors.infoBlockColor2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Select Audio File',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                color: AppColors.infoBlockTextColor2,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ) : Container(),
//                _isCallRecorded ? CustomTextField(
//                  label: 'Other Participants',
//                  controller: null,
//                  isObsecure: false,
//                  inputType: TextInputType.text,
//                  topMargin: 10,
//                  size: size,
//                ) : Container(),
                  ],
                ),
              ),
            ),
            BottomButtons(
              decreaseStackIndex: _decreaseStackIndex,
              increaseStackIndex: _increaseStackIndex,
              size: size,
            )
          ],
        ),
      ),
    );
  }

  _outTap(){
    setState(() => _isIn = false);
    debugPrint('OUT tapped');
  }
  _inTap(){
    setState(() => _isIn = true);
    debugPrint('IN tapped');
  }

  _callYesTap(){
    setState(() => _isCallRecorded = true);
    debugPrint('Yes tapped');
  }
  _callNoTap(){
    setState(() => _isCallRecorded = false);
  }

  Widget _step4({Size size}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: size.width/1.2,
                  height: 100,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: _time == 'Tap to Select Time' ?
                    AppColors.infoBlockColor2 :
                    AppColors.infoBlockColor1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.infoBlockColor2,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                              'Value of Call, Ticket, Inquiry',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                  color: AppColors.infoBlockTextColor2,
                                  fontSize: 18
                              )
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: TextField(
                            controller: null,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Rs. 100,000/-',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 6,
                  child: ExpansionTile(
                    title: Text('Product Prices'),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: NoBorderTextField(
                          label: 'Enter Product Price e.g. Rs. 7/-',
                          controller: null,
                          isObsecure: false,
                          inputType: TextInputType.text,
                          topMargin: 0,
                          size: size,
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 6,
                  child: ExpansionTile(
                    title: Text('Product Quantity'),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: NoBorderTextField(
                          label: 'Enter Product Quantity e.g. Rs. 7/-',
                          controller: null,
                          isObsecure: false,
                          inputType: TextInputType.text,
                          topMargin: 0,
                          size: size,
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 6,
                  child: ExpansionTile(
                    title: Text('Product Complaint'),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: NoBorderTextField(
                          label: 'Enter Product Complaint',
                          controller: null,
                          isObsecure: false,
                          inputType: TextInputType.text,
                          topMargin: 0,
                          size: size,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            BottomButtons(
              decreaseStackIndex: _decreaseStackIndex,
              increaseStackIndex: _increaseStackIndex,
              size: size,
            )
          ],
        ),
      ),
    );
  }

  /// *********************** STEP 1 ****************************/
  List<DropdownMenuItem<Customer>> buildDropDownMenItems(
      List<Customer> list) {
    List<DropdownMenuItem<Customer>> items = List();
    for (Customer customer in list) {
      items.add(
        DropdownMenuItem(
          value: customer,
          child: Text(customer.name),
        ),
      );
    }
    return items;
  }

  onChangeDropDownItem(Customer value) => setState(() => _selectedCustomer = value);


  /// *********************** STEP 2 ****************************/
  _onProductSelectCallback(List<String> value){
    _selectedProductsList = value;
    debugPrint('Product selected');
  }

  _onPurposeSelectCallback(List<String> value){
    _selectedPurposeList = value;
  }

  Future<bool> _askAlertWill() async{
    if(_stepIndex == 0){
      Ask().askAlert(
          message: 'Do you want to go back?',
          yesAction: 'Yes',
          noAction: 'No',
          func: () => Navigator.pop(context),
          context: context
      );
    } else{
      _decreaseStackIndex();
    }
    return false;
  }

  _pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2030)
    ).then((value) {
      setState(() => _date = "${value.day}-${value.month}-${value.year}");
    });
  }
  _pickTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() => _time = "${value.format(context)}");
    });
  }

  _increaseStackIndex(){
    if(_stepIndex < 6){
      debugPrint('Index Increased');
      setState(() => _stepIndex++);
    }
  }
  _decreaseStackIndex(){
    if(_stepIndex > 0){
      debugPrint('Index Decreased');
      setState(() => _stepIndex--);
    } else if(_stepIndex == 0){
      debugPrint('Navigtaor POP called');
      _askAlertWill();
    } else{
      debugPrint('Index hi Index ayy');
    }
  }
//  Widget _backNextBtn(){
//    return Align(
//      alignment: Alignment.bottomCenter,
//      child: Container(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            RaisedButton(
//              padding: EdgeInsets.only(left: 40, right: 40),
//              color: Colors.red,
//              onPressed: _decreaseStackIndex,
//              child: Text('BACK', style: TextStyle(color: Colors.white),),
//            ),
//            RaisedButton(
//              padding: EdgeInsets.only(left: 40, right: 40),
//              color: Colors.green,
//              onPressed: _increaseStackIndex,
//              child: Text('NEXT', style: TextStyle(color: Colors.white),),
//            )
//          ],
//        ),
//      ),
//    );
//  }
}
