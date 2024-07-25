class WeatherModel {
  final String? city;

  final double? temp;

  final double? maxTem;

  final double? minTemp;

  final String? date;

  final String? image;

  final String? weatherCondition;

  WeatherModel(
      {required this.city,
      required this.temp,
      required this.maxTem,
      required this.minTemp,
      required this.date,
      this.image,
       required this.weatherCondition,
      });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json["location"]["name"],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTem: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
