

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/main.dart';

class widgetType extends ConsumerWidget {
  const widgetType({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final name = ref.watch(nameProvider1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('consumer type'),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[200],
        child: Center(child: Text(name)),

      ),
    );
  }
}

class stateLessConsumer extends StatelessWidget {
  const stateLessConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('stateless widget '),
          ),
          body:Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue[200],
            child: Center(child: Text(ref.watch(nameProvider1))),

          ),
        );
      }
    );
  }
}
