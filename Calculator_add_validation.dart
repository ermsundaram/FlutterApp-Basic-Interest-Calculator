1.Create a Form with a GlobalKey

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple Calculator', home: SIForm(),
          theme:ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent
          )),
  );
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();

  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _currentItemSelected = '';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {

    TextStyle  textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Form(
          key: _formKey,
          child:Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(
                children: [
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextField(
                        style: textStyle,
                        controller: principalController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Principal',
                            labelStyle: textStyle,
                            hintText: 'Enter Principal eg.12000',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextField(
                        style: textStyle,
                        controller: roiController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Rate of Interest',
                            labelStyle: textStyle,
                            hintText: 'In Percent',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:  Row(
                      children: [
                        Expanded(
                            child: TextField(
                              style: textStyle,
                              controller: termController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  labelStyle: textStyle,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: _currentItemSelected,
                                onChanged: (String newValueSelected) {
                                  _onDropDownItemSelected(newValueSelected);
                                }))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:Row(
                      children: [
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text('Calculate',textScaleFactor: 1.5,),
                          onPressed: (){
                            setState(() {
                              this.displayResult = _calculateTotalReturns();
                            });
                          },
                        )),
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Reset',textScaleFactor: 1.5),
                          onPressed: (){
                            setState(() {
                              _reset();
                            });
                          },
                        ))
                      ],
                    ) ,
                  ),
                  Padding(padding: EdgeInsets.all(_minimumPadding * 2),
                      child: Text(this.displayResult,style: textStyle))
                ],
              )
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage,width: 125.0,height: 125.0);
    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term)/100;

    String result ='After $term years,your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text="";
    roiController.text="";
    termController.text="";
    displayResult="";
    _currentItemSelected=_currencies[0];
  }
}

2.Add TextForm Field with validation logic

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple Calculator', home: SIForm(),
          theme:ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent
          )),
  );
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();

  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _currentItemSelected = '';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {

    TextStyle  textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Form(
          key: _formKey,
          child:Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(
                children: [
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: principalController,
                        keyboardType: TextInputType.number,
                        validator: (String value){
                           if(value.isEmpty)
                             return 'Please enter principal amount';
                           else
                             return '';
                        },
                        decoration: InputDecoration(
                            labelText: 'Principal',
                            labelStyle: textStyle,
                            hintText: 'Enter Principal eg.12000',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextField(
                        style: textStyle,
                        controller: roiController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Rate of Interest',
                            labelStyle: textStyle,
                            hintText: 'In Percent',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:  Row(
                      children: [
                        Expanded(
                            child: TextField(
                              style: textStyle,
                              controller: termController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  labelStyle: textStyle,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: _currentItemSelected,
                                onChanged: (String newValueSelected) {
                                  _onDropDownItemSelected(newValueSelected);
                                }))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:Row(
                      children: [
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text('Calculate',textScaleFactor: 1.5,),
                          onPressed: (){
                            setState(() {
                              this.displayResult = _calculateTotalReturns();
                            });
                          },
                        )),
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Reset',textScaleFactor: 1.5),
                          onPressed: (){
                            setState(() {
                              _reset();
                            });
                          },
                        ))
                      ],
                    ) ,
                  ),
                  Padding(padding: EdgeInsets.all(_minimumPadding * 2),
                      child: Text(this.displayResult,style: textStyle))
                ],
              )
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage,width: 125.0,height: 125.0);
    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term)/100;

    String result ='After $term years,your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text="";
    roiController.text="";
    termController.text="";
    displayResult="";
    _currentItemSelected=_currencies[0];
  }
}

3.Use button to validate and submit the Form

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple Calculator', home: SIForm(),
          theme:ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent
          )),
  );
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();

  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _currentItemSelected = '';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {

    TextStyle  textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Form(
          key: _formKey,
          child:Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(
                children: [
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: principalController,
                        keyboardType: TextInputType.number,
                        validator: (String value){
                           if(value.isEmpty)
                             return 'Please enter principal amount';
                           else
                             return '';
                        },
                        decoration: InputDecoration(
                            labelText: 'Principal',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0
                            ),
                            hintText: 'Enter Principal eg.12000',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: roiController,
                        keyboardType: TextInputType.number,
                          validator: (String value){
                            if(value.isEmpty)
                              return 'Please enter rate of interest';
                            else
                              return '';
                          },
                        decoration: InputDecoration(
                            labelText: 'Rate of Interest',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0
                            ),
                            hintText: 'In Percent',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:  Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              style: textStyle,
                              controller: termController,
                              keyboardType: TextInputType.number,
                              validator: (String value){
                                if(value.isEmpty)
                                  return 'Please enter time';
                                else
                                  return '';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 15.0
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: _currentItemSelected,
                                onChanged: (String newValueSelected) {
                                  _onDropDownItemSelected(newValueSelected);
                                }))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                    child:Row(
                      children: [
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text('Calculate',textScaleFactor: 1.5,),
                          onPressed: (){
                            setState(() {
                              if(_formKey.currentState.validate())
                                this.displayResult = _calculateTotalReturns();
                            });
                          },
                        )),
                        Expanded(child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Reset',textScaleFactor: 1.5),
                          onPressed: (){
                            setState(() {
                              _reset();
                            });
                          },
                        ))
                      ],
                    ) ,
                  ),
                  Padding(padding: EdgeInsets.all(_minimumPadding * 2),
                      child: Text(this.displayResult,style: textStyle))
                ],
              )
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage,width: 125.0,height: 125.0);
    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term)/100;

    String result ='After $term years,your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text="";
    roiController.text="";
    termController.text="";
    displayResult="";
    _currentItemSelected=_currencies[0];
  }
}



