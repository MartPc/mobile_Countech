import 'package:flutter/material.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
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