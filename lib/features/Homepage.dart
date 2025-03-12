import 'package:bloc_flutter_project/features/counter_bloc.dart';
import 'package:bloc_flutter_project/features/counter_event.dart';
import 'package:bloc_flutter_project/features/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter_project/darkmode/theme.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        bool isDark = theme.brightness == Brightness.dark;
        bool isLight = !isDark;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Counter"),
            elevation: 1,
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme(!isDark);
                },
                icon: Icon(
                  color: Colors.amber,
                  size: 30,
                  isLight
                      ? Icons.light_mode_sharp
                      : Icons.nightlight_round_outlined,
                ),
              ),
              Switch(
                value: isDark,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme(value);
                },
              ),
            ],
          ),
          body: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.count.toString(), // Placeholder for counter value
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blueAccent.withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(DecrementCount());
                            }, // Placeholder for decrement function
                            icon: const Icon(
                              Icons.remove,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(IncrementCount());
                            }, // Placeholder for increment function
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
