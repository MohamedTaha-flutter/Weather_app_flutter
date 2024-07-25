import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_n/bloc/cubit.dart';
import 'package:weather_app_n/bloc/state.dart';
import 'package:weather_app_n/views/home_view.dart';
import 'package:weather_app_n/widgets/weather_info_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var color =  BlocProvider.of<AppCubit>(context).weatherModel?.weatherCondition ;
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: getColorTheme("$color ")
            ),
            home: const HomeView(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

   MaterialColor getColorTheme(String condition) {
    switch (condition) {
      case "Sunny":
        return Colors.deepOrange;
      case "Partly cloudy":
      case "Cloudy":
      case "Overcast":
        return Colors.blue;
      case "Mist":
      case "Patchy rain possible":
      case "Patchy snow possible":
      case "Patchy sleet possible":
      case "Patchy freezing drizzle possible":
      case "Thundery outbreaks possible":
      case "Fog":
        return Colors.grey;
      case "Blowing snow":
      case "Blizzard":
        return Colors.cyan;
      case "Freezing fog":
      case "Patchy light drizzle":
      case "Light drizzle":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
      case "Light sleet":
      case "Moderate or heavy sleet":
        return Colors.lightBlue;
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
        return Colors.blueGrey;
      case "Patchy heavy snow":
      case "Heavy snow":
        return Colors.blueGrey;
      case "Ice pellets":
        return Colors.blueGrey;
      case "Light rain shower":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
        return Colors.blueGrey;
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return Colors.blueGrey;
      case "Light snow showers":
      case "Moderate or heavy snow showers":
        return Colors.blueGrey;
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.blueGrey;
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.amber;
      default:
        return Colors.lightBlue;
    }
  }



