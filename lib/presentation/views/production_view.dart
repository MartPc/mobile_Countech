import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({super.key});

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {

  @override
  void initState() {
    super.initState();
    getData();


  }

  Future<void> getData() async {
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

    response;
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello, World!'),
      )
    );
  }
}