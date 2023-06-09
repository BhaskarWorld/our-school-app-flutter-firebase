import 'package:ourESchool/core/Models/holiday_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:world_holidays/internal/keys.dart';

class CalendarificApiCall {
  String apiKey =
      'c98559dea695455cbe358a1d75a36a29a0f3bda2'; //API key from calendarific.com :)
  String currentYear = DateTime.now().year.toString();

  Future<HolidayData> getHolidays(String countryCode) async {
    final response = await http.get(
        'https://calendarific.com/api/v2/holidays?country=$countryCode&year=$currentYear&api_key=$apiKey');
    if (response.statusCode == 200) {
      final jsonData = await json.decode(response.body);
      return HolidayData.fromJson(jsonData);
    } else {
      throw Exception("Failed to get holidays");
    }
  }
}
