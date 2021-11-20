import 'package:flutter/material.dart';

class ListItem{
  @required String id;
  @required bool isdone=false;
  @required String task;

  ListItem({this.id,this.isdone,this.task});
}