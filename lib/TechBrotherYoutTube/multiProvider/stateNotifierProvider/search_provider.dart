import 'package:flutter_riverpod/flutter_riverpod.dart';


final provider = StateNotifierProvider<search_provider,User>((ref){
      return search_provider();
    }
);

class search_provider extends StateNotifier<User>{
    search_provider():super(User(age: false,name: ''));

    void search(String value){
      state = state.copyWith(name: value);
    }
    void toggle(bool val){
      state = state.copyWith(age: val);
    }
}

class User{
  final String name;
  final bool age;

  User({required this.name,required this.age});
  User copyWith({String? name,bool? age}){
      return User(name: name??this.name, age: age??this.age);
  }
}
