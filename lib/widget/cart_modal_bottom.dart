import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({super.key, required this.addTask});

  final Function addTask;

  String textValue = "";

  void _handleOnClick(BuildContext context) {
    if (textValue.isEmpty) {
      return;
    }
    addTask(textValue);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              textValue = text;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Your Task",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => _handleOnClick(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text("Add Task"),
            ),
          )
        ],
      ),
    );
  }
}
