import 'package:intl/intl.dart';

class AppStrings {
  static const String appName = 'WeatherApp';
  static const String favLocations = 'Favourite locations';
  static const String otherLocations = 'Other locations';
  static const String manageLocation = 'Manage Location';
  static const String reportLocation = 'Report wrong location';
  static const String contactUs = 'Contact us';
  static const String todayTemp = 'Today\'s Temperature';
  static const String expect ='Expect the same as yesterday';
  static const String search = 'search';
  static const String feelsLike = 'Feels Like';
  static const String enterData = 'Enter Data to search';
  static const String enterValidData = 'Enter a valid Country or city to search';


  /// app route
  static const String noRouteFound = 'No Route Found';

  /// Date-time
  static const String sunrise = 'Sunrise';
  static const String sunset = 'Sunset';
  static String dayNow = DateFormat('E').format(DateTime.now());

  static String hourNow = DateFormat('h:mm a').format(DateTime.now()).toLowerCase();

  /// info
  static const String uvIndex = 'UV index';
  static const String wind = 'Wind';
  static const String humidity = 'Humidity';

  static const String high = 'High';
  static const String low = 'Low';

  static const String speed = 'km/h';
  static const String percent = '%';

  /// symbols
  static const String symbolDegree = '°';
}
