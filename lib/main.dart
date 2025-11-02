import 'package:block_practices/bloc/counter/counter_bloc.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_bloc.dart';
import 'package:block_practices/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: MaterialApp(
          title: 'Flutter Bloc State Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
