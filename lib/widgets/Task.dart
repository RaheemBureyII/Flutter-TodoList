import "package:flutter/material.dart";
import 'package:todo/models/List.dart';

class Task extends StatelessWidget {
  final Lists items;
  final int index;
  Task(this.items, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.purple),
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.tight,
              child:
                  Text(items.items[index].task, style: TextStyle(fontSize: 20,color: Colors.white)))
        ],
      ),
    );
  }
}
