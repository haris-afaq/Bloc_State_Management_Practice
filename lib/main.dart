import 'package:block_practices/bloc/counter/counter_bloc.dart';
import 'package:block_practices/bloc/get_api_practice_again/get_post_bloc.dart';
import 'package:block_practices/bloc/post/post_bloc.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_bloc.dart';
import 'package:block_practices/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => PostBloc()),
        BlocProvider(create: (context)=> GetPostBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc State Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
