import 'package:calendar/core/services/calendar_api_service.dart';
import 'package:calendar/core/viewModels/event_viewModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUp() {
  locator.registerLazySingleton(() => EventListPageViewModel());
  locator.registerLazySingleton(() => CalendarApiService());
}
