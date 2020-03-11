import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

void main() => runApp(Date_p());

class Date_p extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePagestate();
  }
}

class _HomePagestate extends State<HomePage>
{
  DateTime _currentdate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String _formatdate= DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Date Picker',style: TextStyle(fontSize: 20,color: Colors.white),),),
        backgroundColor: Colors.grey,
      ),
      body:
      Container(
        padding: EdgeInsets.only(top:300,left: 70,right: 50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('Date : $_formatdate'),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: (){
                      CupertinoRoundedDatePicker.show(
                        context,
                        fontFamily: "Mali",
                        initialDatePickerMode: CupertinoDatePickerMode.date,
                        minimumYear: 2000,
                        maximumYear: 2022,
                        onDateTimeChanged: (dateTime){
                          setState(() {
                            _currentdate=dateTime;
                          });
                        },
                      );
                    },
                    icon: Icon(Icons.date_range,size: 50,color: Colors.grey,),
                  ),
                )
              ],
            )
          ],
        ),
      )
      ,
    );
  }
}