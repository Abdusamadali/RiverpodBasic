import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mulitprovider.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('multi Provider'),
      backgroundColor: Colors.grey,),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context,ref,child){
              final prov = ref.watch(sliderProvider.select((state)=>state.showPassword));
              return GestureDetector(
                onTap: ()=>ref.read(sliderProvider.notifier).state = ref.read(sliderProvider).copyWith(showPassword: !prov) ,
                child: (prov)?Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined),
              );
            }),
            //box
            Consumer(builder: (context,ref,child){
              final prov = ref.watch(sliderProvider);
              return Container(
                height: 200,
                width: 200,
                color: Colors.blue.withOpacity(prov.slider_val),
              );
            }),
            Consumer(builder: (context,ref,child){
              final prov  = ref.watch(sliderProvider);
              return Slider(value: prov.slider_val, onChanged: (value){
                ref.watch(sliderProvider.notifier).state= prov.copyWith(slider_val: value);
              });
            }),
          ],
        ),
      ),
    );
  }
}
