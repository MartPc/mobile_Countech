import 'package:countech_app/infrastructure/models/data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({Key? key}) : super(key: key);

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {
  List<Data>? dataList;
  List<Data>? filterItems;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    setState(() {
      dataList = List<Map<String, dynamic>>.from(response.data)
          .map((e) => Data.fromJson(e))
          .toList();
      filterItems = dataList;
    });
  }

  void searchItem(String text) {
    setState(() {
      filterItems = dataList!
          .where((i) => i.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(hintText: 'Search by title'),
          onChanged: searchItem,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (filterItems == null || index >= filterItems!.length) {
            return Center(child: CircularProgressIndicator());
          }
          final data = filterItems![index];
          return Card(
            child: ListTile(
              title: Text(data.title),
              subtitle: Text(data.body),
            ),
          );
        },
        itemCount: filterItems?.length ?? 0,
      ),
    );
  }
}
