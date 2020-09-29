
import 'core/services/calendar_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  CalendarApiService _calendarClient = CalendarApiService();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  TextEditingController _eventName = TextEditingController();
  TextEditingController _eventDescription = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0d47a1),
        centerTitle: true,
        title: Text('Calendar App'),
      ),
      body: /*_body(context)*/
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 25, top: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2019, 3, 5),
                            maxTime: DateTime(2200, 6, 7), onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            this._startTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);

                      },
                      color: Color(0xff448aff),
                      child: Text(
                        'Event Start Date',
                        style: TextStyle(color: Color(0xffe3f2fd)),
                      )),

                  Text(_startTime.toString()),

                ],
              ),
            ),

            // event start date^^^^^


            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 25, top: 22, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {

                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2019, 3, 5),
                            maxTime: DateTime(2200, 6, 7), onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            this._endTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);

                      },
                      color: Color(0xff448aff),
                      child: Text(
                        'Event End Date',
                        style: TextStyle(color: Color(0xffe3f2fd)),
                      )),
                  Text(_endTime.toString()),
                ],
              ),
            ),

            //event end date^^^^^^^


            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _eventName,
                decoration: InputDecoration(hintText: 'Enter Event name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _eventDescription,
                decoration:
                    InputDecoration(hintText: 'Enter Event description'),
              ),
            ),
            RaisedButton(
                child: Text(
                  'Insert Event',
                ),
                color: Colors.grey,
                onPressed: () {
                  //log('add event pressed');
                  _calendarClient.insert(
                    _eventName.text,
                    _startTime,
                    _endTime,
                    _eventDescription.text,
                  );
                }),
            RaisedButton(
                child: Text('khobaa'),
                onPressed:(){
              _calendarClient.getEventsFromCalendarApi();
            }),
          ],
        ),
      ),
      backgroundColor: Color(0xffe3f2fd),
    );
  }


  }

