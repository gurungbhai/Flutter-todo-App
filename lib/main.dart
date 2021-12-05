import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      title: 'TODO APP',
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  late String value;
  var listTODO = [''];

  // ignore: non_constant_identifier_names
  addTodo(String Item) {
    setState(() {
      listTODO.add(Item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APP'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addTodo(value);
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add Item',
                    ),
                    onChanged: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                )
              : ListTile(
                  title: Text(listTODO[index]),
                  leading: const Icon(Icons.work),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        listTODO.removeAt(index);
                      });
                    },
                  ),
                );
        },
        itemCount: listTODO.length,
      ),
    );
  }
}
