
import 'package:flutter/material.dart';
import '../finisheditemslist.dart';

class FinishedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( child: ListView.builder(
      itemBuilder: (ctx, index) {
        return Row(children: [Text(finisheditems[index].task)],);
      },
      itemCount: finisheditems.length,
    ),
    );
  }
}
