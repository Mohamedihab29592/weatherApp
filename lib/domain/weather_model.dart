class CurrentWeatherModel {
  LocationModel? locationModel;
  CurrentWeather? currentWeather;
  ForecastWeather? forecastWeather;

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    locationModel = LocationModel.fromJson(json['location']);
    currentWeather = CurrentWeather.fromJson(json['current']);
    forecastWeather = ForecastWeather.fromJson(json['forecast']);
  }
}

class LocationModel {
  String? name;
  String? region;
  String? country;
  String? localtime;

  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    localtime = json['localtime'];
  }
}

class CurrentWeather {
  double? tempC;
  String? text;
  String? icon;
  double? windKph;
  double? feelsLike;
  int? humidity;
  double? uv;
  int ? isDay;


  CurrentWeather.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    text = json['condition']['text'];
    icon = json['condition']['icon'];
    windKph = json['wind_kph'];
    humidity = json['humidity'];
    feelsLike = json['feelslike_c'];
    uv = json['uv'];
    isDay = json['is_day'];

  }
}

class ForecastWeather {
  List<ForecastDay> forecast = [];

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    json['forecastday'].forEach((e) {
      forecast.add(ForecastDay.fromJson(e));
    });
  }
}



class ForecastDay {
  String? date;
  Day? day;
  Astro? astro;
  List<ForecastHour>? hours;

  ForecastDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hours = <ForecastHour>[];
      json['hour'].forEach((v) {
        hours!.add(ForecastHour.fromJson(v));
      });
    }
    // json['hour'].forEach((element) {
    //   hours!.add(ForecastHour.fromJson(element));
    // });
  }
}

class Day {
  double? maxTempC;
  double? minTempC;
  String? icon;
  String? text;
  int? dailyWillItRain;

  Day.fromJson(Map<String, dynamic> json) {
    maxTempC = json['maxtemp_c'];
    minTempC = json['mintemp_c'];
    text = json['condition']['text'];
    icon = json['condition']['icon'];
    dailyWillItRain = json['daily_will_it_rain'];
  }
}

class Astro {
  String? sunrise;
  String? sunset;


  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];

  }
}

class ForecastHour {
  String? time;
  double? tempC;
  String? text;
  String? icon;
  int? hourlyWillItRain;

  ForecastHour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    hourlyWillItRain = json['will_it_rain'];

    text = json['condition']['time'];
    icon = json['condition']['icon'];
  }
}
