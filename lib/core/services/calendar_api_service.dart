import 'dart:developer';
import 'package:calendar/core/models/event_model.dart';
import 'package:flutter/material.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:url_launcher/url_launcher.dart';


class CalendarApiService {
  static const _scopes = const [CalendarApi.CalendarScope];
  static final _clientID = new ClientId(
      "214443681223-ivgieb0uqb0aov75cruabbg797codh0o.apps.googleusercontent.com",
      "");

  Future<Events> getEventsFromCalendarApi() async {
    String calendarId = "primary";
    AuthClient client = await clientViaUserConsent(_clientID, _scopes, prompt);
    var calendar = CalendarApi(client);
    Events events;
    events = await calendar.events.list(calendarId);
    return events;
  }

  insert(title, startTime, endTime, description) {
    clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) {
      var calendar = CalendarApi(client);
      calendar.calendarList.list().then((value) => print("VAL________$value"));

      String calendarId = "primary";
      Event event = Event();

      event.summary = title;

      event.description = description;

      EventDateTime start = new EventDateTime();
      start.dateTime = startTime;
      start.timeZone = "GMT+03:30";
      event.start = start;

      EventDateTime end = new EventDateTime();
      end.timeZone = "GMT+03:30";
      end.dateTime = endTime;
      event.end = end;

      try {
        calendar.events.insert(event, calendarId).then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            log('Event added in google calendar');
          } else {
            log("Unable to add event in google calendar");
          }
        });
      } catch (e) {
        log('Error creating event $e');
      }

    });


  }

  addToCalendarApi(EventModel eventModel){
    Event event  = eventModel.toEvent();
  }

  void prompt(String url) async {
      print("Please go to the following URL and grant access:");
      print("  => $url");
      print("");

      if (await canLaunch(url)) {
        await launch(url);
      } else {
      throw 'Could not launch $url';
    }
  }
}
