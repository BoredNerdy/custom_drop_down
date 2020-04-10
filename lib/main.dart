import 'package:custom_drop_down/CustomDropDown.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Dropdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Custom Dropdown Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> itemList =["item one","item two","item three","item four","item five","item six","item eight","item nine","item ten"];
  String selected ;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _displaySnackBar(String value) {
    final snackBar = SnackBar(content: Text('selected item : $value'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:  CustomDropDown(
          items: itemList.map((item) {
            return new CustomDropDownItems(
              item,
              item,
            );
          }).toList(),
          value: selected ,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.75,
          callback: (newVal) {
            if (newVal != null) {
              setState(() {
                selected=newVal;
              });
              _displaySnackBar(newVal);
            }
          },
        ),
      ),
    );
  }
}
