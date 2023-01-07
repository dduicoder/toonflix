import 'package:flutter/material.dart';

import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const waitTime = 10;
  int totalCounts = 0;
  int totalSeconds = waitTime;
  bool isFocusTime = false;
  bool isPlaying = false;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds == 0) {
        timer.cancel();
        totalSeconds = waitTime;
        totalCounts += 1;
        isPlaying = false;
      } else {
        totalSeconds -= 1;
      }
    });
  }

  void onPlayButtonClicked() {
    if (!isPlaying) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );
    } else {
      timer.cancel();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void onResetButtonClicked() {
    if (isPlaying) {
      timer.cancel();
    }

    setState(() {
      isPlaying = false;
      totalSeconds = waitTime;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  isPlaying ? "Lets go!" : "Take your time",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 96,
                  color: Theme.of(context).cardColor,
                  onPressed: onPlayButtonClicked,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_outlined
                        : Icons.play_circle_outlined,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                IconButton(
                  iconSize: 32,
                  color: Theme.of(context).cardColor,
                  onPressed: onResetButtonClicked,
                  icon: const Icon(Icons.restore),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "$totalCounts",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 48,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
