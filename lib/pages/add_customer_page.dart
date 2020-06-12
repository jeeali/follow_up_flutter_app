import 'package:flutter/material.dart';
import 'package:follow_up_app/widgets/text_feild.dart';

class AddCustomerPage extends StatefulWidget {
  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Add New Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            CustomTextField(
              label: 'First Name',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              label: 'Last Name',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              label: 'Area',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              label: 'City',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              label: 'Occupation',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              label: 'Phone No.',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.phone,
              topMargin: 20,
              size: _size,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text('Submit'),
      ),
    );
  }
}
