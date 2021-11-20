import 'package:flutter/material.dart';
import './listmodalsheet.dart';
import "../models/List.dart";
import './ListElement.dart';
import '../ListItems.dart';
class Todolists extends StatefulWidget {
  @override
  _TodolistsState createState() => _TodolistsState();
}

class _TodolistsState extends State<Todolists> {
  final items = listItems;

  void _addList(String title) {
    final newlist =
    Lists(id: DateTime.now().toString(), title: title, items: []);
    setState(() {
      listItems.add(newlist);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TweenAnimationBuilder(
               tween: Tween<double>(begin: 0,end: 1),
                builder: (BuildContext ctx,double val,Widget child){
                  return Opacity(opacity: val,child:child);
                },
                duration: Duration(seconds:1),
                child: Container(
                      height: (MediaQuery.of(context).size.height*1)*0.7,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 3 / 2),
                        children: items
                            .map((data) => ListElement(
                            data.title, data.id, data.items.length.toString()))
                            .toList(),
                      ),
              ),
            )
           ,
            FloatingActionButton(child: Icon(Icons.add),onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bctx) {
                    return ListModal(_addList);
                  });
            })
          ],
        ),
      ),
    );
  }
}
