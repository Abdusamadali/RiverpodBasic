import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/TechBrotherYoutTube/multiProvider/stateNotifierProvider/search_provider.dart';
import 'package:riverpod_basic/providers/provider.dart';


class Statenotifierhomepage extends StatelessWidget {
  const Statenotifierhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('state Notifier HomePage'),),
        body: Center(

            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context,ref,child) {
                    return TextField(onChanged: (value) {
                      ref.read(provider.notifier).search(value);
                    },);
                  }
                ),
             Consumer(builder: (context,ref,child){
               final provider1 =ref.watch((provider).select((state)=>state.name));
               return Text(provider1);
             }),
                Consumer(builder: (context,ref,child){
                  final provider1 =ref.watch((provider).select((state)=>state.age));
                  return Switch(value: provider1, onChanged: (val){
                    ref.read(provider.notifier).toggle(val);
                  });
                }),
              ],
            ),
        ),
    );
  }
}
