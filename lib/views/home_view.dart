import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_n/bloc/cubit.dart';
import 'package:weather_app_n/bloc/state.dart';
import 'package:weather_app_n/main.dart';
import 'package:weather_app_n/views/search%20view.dart';
import 'package:weather_app_n/widgets/no_weather_body.dart';
import 'package:weather_app_n/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var backColor = BlocProvider.of<AppCubit>(context).weatherModel?.weatherCondition ;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: getColorTheme("$backColor")[400]!,
            title: const Text(
              'Weather App',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return SearchView();
                      }));
                },
                icon: const Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              )
            ],
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppInitialState) {
                return const NoWeatherBody();
              } else if (state is AppGetWeatherState) {
                return const WeatherInfoBody();
              } else {
                return const Text("OOPS they  are an error   ");
              }
            },
          ),
        );
      },
    );
  }
}
