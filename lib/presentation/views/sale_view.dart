import 'package:flutter/material.dart';


class SaleView extends StatefulWidget {
  const SaleView({super.key});

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current profile: $count'),
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