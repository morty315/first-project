import 'package:calendar/service_locator.dart';
import 'package:calendar/ui/event_page.dart';
import 'package:get/get.dart';

import 'add_event_page.dart';
import 'package:flutter/material.dart';

void main() {

  setUp();
  runApp(GetMaterialApp(
    //title: 'Calendar App',
    debugShowCheckedModeBanner: false,
    home: EventListPage(),
  ));
}
