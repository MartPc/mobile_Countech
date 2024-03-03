import 'package:flutter/material.dart';

class MotorView extends StatefulWidget {
  const MotorView({super.key});

  @override
  State<MotorView> createState() => _MotorViewState();
}

class _MotorViewState extends State<MotorView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current main: $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}