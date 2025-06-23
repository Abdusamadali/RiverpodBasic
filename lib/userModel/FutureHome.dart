import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/main.dart';

class homeFutre extends ConsumerWidget {
  const homeFutre({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsnc = ref.watch(fetchUserProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.blue[200],
      body: userListAsnc.when(data: (data) {
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),

                child: ListTile(
                  title: Text(data[index].name??''),
                  subtitle: Text(data[index].email??' '),
                  leading: Text(data[index].id.toString()),
                  tileColor: Colors.blue,

                ),
              );
            });
      }, error: (error, _) {
        showDialog(context: context, builder: (context) {
          return AlertDialog(backgroundColor: Colors.blue,
            title: Text("Error message"),
            content: Text(error.toString()),
          );
        },);
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
