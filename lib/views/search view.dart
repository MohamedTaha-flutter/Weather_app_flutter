import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_n/bloc/cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value)  {
                  BlocProvider.of<AppCubit>(context).getWeather(cityName: value) ;
                  Navigator.pop(context);
                  },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  label: Text('Search'),
                  hintText: 'Enter Your city',
                ),
              ),
            ],
          ),
        ));
  }
}
