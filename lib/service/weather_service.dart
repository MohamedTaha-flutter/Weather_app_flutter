import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_n/modeles/model.dart';

class WeatherService {
  final Dio dio = Dio();

  WeatherService();

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'cffa502d0f11468c910154916240103';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (error) {
      final String errorException = error.response?.data['error']['message'] ??
          ' oops there was an error  , try latter ';
      throw Exception(errorException);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try latter');
    }
  }
}
