import 'package:calendar/add_event_page.dart';
import 'package:calendar/core/models/event_model.dart';
import 'package:calendar/core/services/calendar_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:stacked/stacked.dart';
import 'package:calendar/service_locator.dart';


class EventListPageViewModel extends BaseViewModel{

  List<EventModel> eventModels = [];

  CalendarApiService _calendarApiService = locator<CalendarApiService>();

  init()async{
   await getEvents();
  }

   getEvents() async {
    Events events = await _calendarApiService.getEventsFromCalendarApi();
    events.items.forEach((event) {
      print(event.summary);
     eventModels.add( EventModel.fromEvent(event));
    });
    notifyListeners();
  }

  void goToAddEventPage(){
    Get.to(AddEventPage());
  }
}