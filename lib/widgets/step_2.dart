import 'package:flutter/material.dart';
import 'package:follow_up_app/pages/add_calls_page.dart';
import 'package:follow_up_app/utils/colors.dart';
import 'bottom_buttons.dart';

List<String> _selectedPurposeChoices = List();
List<String> _selectedProductsChoices = List();

class Step2 extends StatefulWidget {

  final Size size;
  final Function decreaseStackIndex;
  final Function increaseStackIndex;
  final Function onPurposeSelectCallback;
  final Function onProductSelectCallback;

  const Step2({Key key,
    @required this.size,
    @required this.decreaseStackIndex,
    @required this.increaseStackIndex,
    @required this.onPurposeSelectCallback,
    @required this.onProductSelectCallback}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 20),
                  child: Center(
                    child: Text(
                      'Call Purpose',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: _buildPurposeChoiceList(),
                  ),
                ),
                Divider(
                  color: AppColors.lightTextColor,
                  height: 50,
                  indent: 40,
                  endIndent: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Center(
                    child: Text(
                      'Products Discussed',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: _buildProductChoiceList(),
                  ),
                ),
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

  // this function will build and return the choice list
  _buildPurposeChoiceList() {
    List<Widget> choices = List();
    AddCallsPage.purposeList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          padding: EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
          label: Text(
            item,
            style: TextStyle(
                fontSize: 20
            ),
          ),
          pressElevation: 0,
          elevation: 0,
          selected: _selectedPurposeChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedPurposeChoices.contains(item)
                  ? _selectedPurposeChoices.remove(item)
                  : _selectedPurposeChoices.add(item);
            });
            widget.onPurposeSelectCallback(_selectedPurposeChoices);
          },
        ),
      ));
    });
    return choices;
  }

  // this function will build and return the choice list
  _buildProductChoiceList() {
    List<Widget> choices = List();
    AddCallsPage.productsList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          padding: EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
          label: Text(
            item,
            style: TextStyle(
                fontSize: 20
            ),
          ),
          pressElevation: 0,
          elevation: 0,
          selected: _selectedProductsChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedProductsChoices.contains(item)
                  ? _selectedProductsChoices.remove(item)
                  : _selectedProductsChoices.add(item);
            });
            widget.onProductSelectCallback(_selectedProductsChoices);
          },
        ),
      ));
    });
    return choices;
  }

}
