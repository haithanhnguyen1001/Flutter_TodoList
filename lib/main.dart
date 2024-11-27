import 'package:flutter/material.dart';
import 'package:flutter_application_2/modal/items.dart';

import 'widget/cart_body_widget.dart';
import 'widget/cart_modal_bottom.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true, //Căn giữa tiêu đề
        backgroundColor: Colors.blueAccent, //Nền của appBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        scrollDirection: Axis.vertical,
        child: Column(
          children: items
              .map(
                  (item) => CardBody(item: item, deleteTask: _handleDeleteTask))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, //Vị trí show modal
            builder: (BuildContext context) {
              return ModalBottom(addTask: _handleAddTask);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
