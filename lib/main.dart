import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/changeNotifier.dart';
import 'package:riverpod_basic/provider.dart';
import 'package:riverpod_basic/stateNotifierProvider.dart';
import 'package:riverpod_basic/stateprovider.dart';

import 'StateNotifier.dart';

//providers
// 1. provider
// 2. state provider
// 3. StateNotifier and StateNotifierProvider
// 4. change notifier provider

final nameProvider1 = Provider((ref) {
  return 'abdus  ali';
});

//state provider
final nameProvider2 = StateProvider<String?>((ref) {
  return null;
});

//state provider
final userProvider =
    StateProvider((ref) => UserNotifier(User(name: '', age: 0)));

//state notifier and stateNotifierProvider
final NProvider =
    StateNotifierProvider<UserNotifier,User>((ref) => UserNotifier(const User(name: '', age: 0)));


//change notifier provider
final userChangeNotifierProvider = ChangeNotifierProvider((ref)=>changeNotifier());


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CN_homePage(),
    );
  }
}
