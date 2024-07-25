import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_n/bloc/state.dart';
import 'package:weather_app_n/modeles/model.dart';
import 'package:weather_app_n/service/weather_service.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  WeatherModel?  weatherModel ;
  void getWeather({
    required String cityName,
  }) async {
    try {
       weatherModel = await WeatherService().getWeatherData(cityName: cityName);
      emit(AppGetWeatherState());
    }  catch (error) {
      emit(AppWeatherFailureState());
    }
  }
}
