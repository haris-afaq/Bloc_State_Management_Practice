import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_bloc.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_events.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButtonAndSlider extends StatefulWidget {
  const SwitchButtonAndSlider({super.key});

  @override
  State<SwitchButtonAndSlider> createState() => _SwitchButtonAndSliderState();
}

class _SwitchButtonAndSliderState extends State<SwitchButtonAndSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Example Two",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(state.slider),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, curent) => previous.slider != curent.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  activeColor: Colors.deepPurple,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvents(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
