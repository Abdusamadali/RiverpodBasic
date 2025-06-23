import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/providers/changeNotifier.dart';
import 'package:riverpod_basic/providers/provider.dart';
import 'package:riverpod_basic/userModel/FutureHome.dart';
import 'package:riverpod_basic/userModel/User_Provider.dart';
import 'package:riverpod_basic/providers/stateprovider.dart';
import 'package:riverpod_basic/userModel/user_model_Future_provider.dart';
import 'package:riverpod_basic/TechBrotherYoutTube/multiProvider/todoApp/homePageTodo.dart';
import 'TechBrotherYoutTube/multiProvider/stateNotifierProvider/StateNotifierHomePage.dart';
import 'TechBrotherYoutTube/multiProvider/stateProvider/homePage.dart';
import 'providers/StateNotifier.dart';

//providers
// 1. provider
// 2. state provider
// 3. StateNotifier and StateNotifierProvider
// 4. change notifier provider (mutable)
// 5. Future provider
// 6. stream provider

//widget ref
//provider ref
//ref

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


//Future Provider
final fetchUserProvider = FutureProvider<List<UserApi>>((ref)async{
  return UserRepo().fetchUser();
});











void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TodoHome(),
    );
  }
}
