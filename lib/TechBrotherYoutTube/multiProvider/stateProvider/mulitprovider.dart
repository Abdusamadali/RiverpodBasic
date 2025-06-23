
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<appState>((ref){
  return appState(showPassword: false, slider_val: .5);
});
class appState{
  final bool showPassword;
  final double slider_val;

  appState({required this.showPassword,required this.slider_val});

  appState copyWith({bool? showPassword,double? slider_val}){
    return appState(slider_val: slider_val??this.slider_val,showPassword: showPassword??this.showPassword);
  }
}