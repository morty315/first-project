import 'package:calendar/core/models/event_model.dart';
import 'package:calendar/core/viewModels/event_viewModel.dart';
import 'package:calendar/service_locator.dart';
import 'package:calendar/ui/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventListPageViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => locator<EventListPageViewModel>(),
      builder: (context , model, child) => Scaffold(
      body: ListView.builder(
          itemCount:  model.eventModels.length,
          itemBuilder: (context , index){
            EventModel eventModel = model.eventModels[index];
            return EventWidget(
              title: eventModel.title,
              description: eventModel.description,
              startDate: eventModel.startDate,
              endDate: eventModel.endDate,
            );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          model.goToAddEventPage();
        },
      ),
    ),);
  }
}
