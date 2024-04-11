import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather/weather_cubit.dart';
import 'package:weather/cubit/weather/weather_state.dart';

class HomeBlocBuilderWidget extends StatelessWidget {
  const HomeBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is WeatherFailure) {
          return  Text(state.failureMessage);
        } else if(state is WeatherNetworkError){
          return Text(state.message);
        }
        else if (state is WeatherSuccess) {
          final data = state.response;
          return Text(
            ((data.main!.temp! - 32)/8).toStringAsFixed(1),
            style: const TextStyle(color: Colors.black, fontSize: 100),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
