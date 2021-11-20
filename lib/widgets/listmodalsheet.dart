import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListModal extends StatefulWidget {
 final Function addList;
 ListModal(this.addList);

  @override
  _ListModalState createState() => _ListModalState();
}

class _ListModalState extends State<ListModal> {
  var controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: "Title",
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(),
            hintText: "Enter a title for your list."),
        onSubmitted: (_){widget.addList(controller.text);
        Navigator.of(context).pop();
       },
      ),
    );
  }
}
