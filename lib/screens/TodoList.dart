import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/finisheditemslist.dart';
import 'package:todo/models/List.dart';
import 'package:todo/models/Listitem.dart';
import 'package:todo/widgets/Task.dart';
import '../ListItems.dart';
import '../widgets/TodoLists.dart';

class TodoList extends StatefulWidget {
  // final String id;
  // TodoList(this.id);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var listitems = listItems;

  var controller = TextEditingController();

  bool changeisdone(bool){
    var itemisdone;
    setState(() {
      itemisdone=!bool;
    });
    return itemisdone;

  }

  @override
  Widget build(BuildContext context) {
    var routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var id = routeargs["id"];
    final item = listitems.indexWhere((element) => element.id==id);
    Future<bool> func(BuildContext context){

    }

    //print(item);
    var items=listitems[item];
    return WillPopScope(
      onWillPop:() async {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
         return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(items.title),
        ),
        body: Container(

          child: Column(

            children: [
              Container(
                height: (MediaQuery.of(context).size.height*1)*0.77,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Slidable(
                          endActionPane: ActionPane(motion: ScrollMotion(),
                          children: [
                            SlidableAction(onPressed: (ctx){
                              items.items.remove(items.items[index]);
                              changeisdone(true);
                            },icon:Icons.delete,backgroundColor: Colors.green,spacing: 2,)
                          ],
                          ),
                          child: Task(items,index),
                      );
                    },
                    itemCount: items.items.length,
                  ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(child: Icon(Icons.add),onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bctx) {
                        return TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: "Task",
                              contentPadding: EdgeInsets.all(5),
                              border: OutlineInputBorder(),
                              hintText: "Enter a new task"),
                          onSubmitted: (_){
                            items.items.add(ListItem(id:DateTime.now().toString(),isdone:false,task: controller.text));
                          Navigator.of(context).pop();
                          },
                        );
                      });
                }
                ),
              )
            ],
          )
        )
      ),
    );
  }
}
