import 'package:flutter/material.dart';
import 'package:googleapis/appsactivity/v1.dart';
import 'package:intl/intl.dart';

class EventWidget extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String description;

  EventWidget({this.title, this.startDate, this.endDate, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 * 2,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(title ,style: TextStyle(fontSize: 22),),
          Text(description , style:TextStyle(fontSize: 15)),
          Row(
            children: [
              Row(
                children: [
                 Text(DateFormat.MMMd().format(startDate) + ' At ' , style: TextStyle(fontSize: 16),),
                  Text(DateFormat.Hm().format(startDate) + ' At ' , style: TextStyle(fontSize: 16),),

                ],
              ),
              Row(
                children: [
                  Text(DateFormat.MMMd().format(endDate) + ' At ' , style: TextStyle(fontSize: 16),),
                  Text(DateFormat.Hm().format(endDate) + ' At ' , style: TextStyle(fontSize: 16),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
