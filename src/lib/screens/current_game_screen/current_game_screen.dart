import 'package:flutter/material.dart';

class CurrentGameScreen extends StatefulWidget {
  const CurrentGameScreen({super.key});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                "MI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36),
              ),
              const Spacer(),
              Text(
                "VI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                "1001",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const Spacer(),
              Text(
                "1001",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const Spacer(),
            ],
          ),
        ]),
      ),
    )));
  }
}
