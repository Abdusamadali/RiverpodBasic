import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';


class SN_homePage extends ConsumerWidget {
  const SN_homePage({super.key});

  void submit(WidgetRef ref, {String? name,int? age}){
    ref.read(NProvider.notifier).updateName(name);

    ref.read(NProvider.notifier).updateAge(age);
  }


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final user = ref.watch(NProvider);
    final selectUser = ref.watch(NProvider.select((val)=>val.name));//on changing name property entire widget will rerun

    print('widget built ------------------------------------------------');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('stateless widget '),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[200],
        child: Column(
          children: [
            TextField(
                onSubmitted: (value)=>submit(ref,name: value)
            ),
            TextField(
              onSubmitted: (value)=>submit(ref,age: int.parse(value)),
            ),
            Center(child: Text(user.name)),
            Center(child: Text(user.age.toString()),)
          ],
        ),
      ),
    );
  }

}
