import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  final String title;
  final String id;
  final String itemslength;

  ListElement(this.title, this.id, this.itemslength);

  void selectList(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/todos", arguments: {"id": id});
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectList(context),
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      itemslength,
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}
