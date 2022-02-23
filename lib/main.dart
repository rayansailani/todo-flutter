import 'package:flutter/material.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatefulWidget {
  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  var tasks = [
    {
      'task': 'This is the first task',
      'isCompleted': false,
    }
  ];

  var textController = TextEditingController();

  void resetTasks() {
    setState(() {
      tasks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "GDSC todo",
        ),
        actions: [IconButton(onPressed: resetTasks, icon: Icon(Icons.refresh))],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
                labelText: 'Enter the New Task', border: OutlineInputBorder()),
          ),
        ),
        ...tasks
            .map((task) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    elevation: 6,
                    child: ListTile(
                      title: Text(
                        task['task'].toString(),
                        style: TextStyle(
                            decoration: task['isCompleted'] == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            task['isCompleted'] = value as bool;
                          });
                        },
                        value: task['isCompleted'] as bool,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add({'task': textController.text, 'isCompleted': false});
            textController.clear();
          });
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
