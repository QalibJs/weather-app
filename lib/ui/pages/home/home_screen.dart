import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather/weather_cubit.dart';
import 'package:weather/ui/pages/home/widgets/home_bloc_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit weatherCubit = context.read<WeatherCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeBlocBuilderWidget(),
            TextField(
              controller: weatherCubit.weatherController,
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      weatherCubit.getWeatherInfo();
                    },
                    child: const Text("Search"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
