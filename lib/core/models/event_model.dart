import 'package:googleapis/calendar/v3.dart';

class EventModel{
  DateTime startDate;
  DateTime endDate;
  String description;
  String title;

  EventModel({this.startDate , this.endDate ,  this.title , this.description });

  factory EventModel.fromEvent(Event event){

    return EventModel(
      startDate: event.start.dateTime.toLocal(),
      endDate: event.end.dateTime.toLocal(),
      title: event.summary,
      description: event.description,

    );
  }

  Event toEvent(){
    Event event = Event();
    event.start.dateTime = startDate;
    event.end.dateTime = endDate;
    event.description = description;
    event.summary = title;
    return event;
  }

}