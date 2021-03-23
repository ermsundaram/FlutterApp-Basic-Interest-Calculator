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
  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];

  @override
  Widget build(BuildContext context) {

    TextStyle  textStyle = Theme.of(context).textTheme.title;

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
                    style: textStyle,
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Rate of Interest',
                              hintText: 'In Percent',
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
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text('Calculate',textScaleFactor: 1.5,),
                      onPressed: (){

                      },
                    )),
                    Expanded(child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Reset',textScaleFactor: 1.5),
                      onPressed: (){

                      },
                    ))
                  ],
                ) ,
              ),
              Padding(padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Todo Text',style: textStyle))
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
