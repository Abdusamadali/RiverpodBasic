import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';


class stateProvider extends StatelessWidget {
  const stateProvider({super.key});

  void submit(WidgetRef ref,String value){
         ref.read(nameProvider2.notifier).update((state)=>value);
  }

  @override
  Widget build(BuildContext context) {
    // final name = ref.watch(nameProvider2)??' ';
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('stateless widget '),
    ),
    body:Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.blue[200],
    child: Consumer(

      builder: (context,ref,child) {
        return Column(
          children: [
            TextField(
            onSubmitted: (value)=>submit(ref, value)
            ),
            Center(child: Text(ref.watch((nameProvider2))??""),
            ),
          ],
        );
      }
    ),
    ),
    );
  }
}
