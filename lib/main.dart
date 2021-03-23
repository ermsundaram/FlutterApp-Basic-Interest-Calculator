import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Simple Calculator', home: SIForm()));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Container(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: [
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter Principal eg.12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Rate of Interest',
                              hintText: 'In Percent',
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
                            value: 'Rupees',
                            onChanged: (String newValueSelected) {}))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                child:Row(
                  children: [
                    Expanded(child: RaisedButton(
                      child: Text('Calcualte'),
                      onPressed: (){

                      },
                    )),
                    Expanded(child: RaisedButton(
                      child: Text('Reset'),
                      onPressed: (){

                      },
                    ))
                  ],
                ) ,
              ),
              Padding(padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Todo Text'),)
            ],
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
}
