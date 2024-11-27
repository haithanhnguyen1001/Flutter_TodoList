import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({super.key, required this.item, required this.deleteTask});

  var item;

  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xffDFDFDF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: const TextStyle(
                color: Color(0xff4B4B4B),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                deleteTask(item.id);
              }
              return;
            },
            child: const Icon(
              Icons.delete_outline,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
