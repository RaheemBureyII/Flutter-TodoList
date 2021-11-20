import 'package:flutter/material.dart';
import 'package:todo/models/Listitem.dart';

class Lists{
  @required String id;
  @required String title;
  @required List<ListItem> items;
  Lists({this.id,this.title,this.items});
}