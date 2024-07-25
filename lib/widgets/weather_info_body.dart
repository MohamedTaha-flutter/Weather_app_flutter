import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_n/bloc/cubit.dart';
import 'package:weather_app_n/bloc/state.dart';
import 'package:weather_app_n/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var weatherModel = BlocProvider.of<AppCubit>(context).weatherModel;
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                  getColorTheme("${weatherModel?.weatherCondition}")[50]!,
                  getColorTheme("${weatherModel?.weatherCondition}")[200]!,
                  getColorTheme("${weatherModel?.weatherCondition}")[300]!,
                  getColorTheme("${weatherModel?.weatherCondition}")[400]!,

                ],
                  end: Alignment.topCenter,
                  begin: Alignment.topCenter,
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " City : ${weatherModel?.city}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'Date Time :  ${DateTime
                        .parse('${weatherModel?.date}')
                        .hour}:${DateTime
                        .parse('${weatherModel?.date}')
                        .minute}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https:${weatherModel?.image}',
                      ),
                      Text(
                        '${weatherModel?.temp}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max Temp ${weatherModel?.maxTem}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Min temp ${weatherModel?.minTemp}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${weatherModel?.weatherCondition}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
