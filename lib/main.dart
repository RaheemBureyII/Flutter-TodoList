import 'package:flutter/material.dart';
import 'package:todo/screens/TodoList.dart';
import './widgets/TodoLists.dart';
import './widgets/finisheditems.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(),
      routes: {
        "/home":(ctx)=> Home(),
        "/todos": (ctx) => TodoList(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [Todolists(), FinishedItems()];
  int selectedpage = 0;

  void selectpage(int index) {
    
    setState(() {
      selectedpage = index;

    });
  }



  var title = "TodoLists";

  @override
  Widget build(BuildContext context) {
    if (selectedpage == 0) {
      title = "TodoLists";
     
    } else {
      title = "Finished Items";
     
    }
    //selectpage(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: pages[selectedpage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedpage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.list),
              label: "Current List"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.done),
              label: "Finished")
        ],
      ),
    );
  }
}
