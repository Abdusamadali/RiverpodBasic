import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/TechBrotherYoutTube/multiProvider/todoApp/Item_model.dart';
import 'package:riverpod_basic/providers/provider.dart';

import 'Item_provider.dart';


class TodoHome extends ConsumerWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final tasks = ref.read(ItemProvider.notifier);


    Widget body(){
      final task = ref.watch(ItemProvider);
      if(task.isEmpty){
        return Center(child: Text("no tasks"));
      }else{
        return ListView.builder(
            itemCount: task.length,
            itemBuilder: (context,index){
            return Dismissible(
            background: Container(
              color: Colors.red,

            ),
              onDismissed: (direction){

                final id = task[index].id;
                tasks.deleteItem(id);
                ScaffoldMessenger.of(context).
                showSnackBar(
                  SnackBar(content: Text('${task[index].name} deleted'))
                );
              },
              key: UniqueKey(),
              child: ListTile(
                title: Text(task[index].name
                ),
                trailing: IconButton(onPressed: (){
                  final id = task[index].id;
                  tasks.deleteItem(id);
                }, icon: Icon(Icons.delete_sweep_outlined)),
              ),
            );
        });
      }
    }


    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
        child: Text('todo'),
      ),
      ),
      body: body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        child: Icon(Icons.add),
          onPressed:(){
            final task = DateTime.now();
            tasks.addItem(task.toString());
          }
      ),
    );
  }
}
