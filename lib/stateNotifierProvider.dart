
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  // ✅ copyWith
  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  // ✅ fromJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  // ✅ Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  // ✅ toString
  @override
  String toString() => 'User(name: $name, age: $age)';
}




//state notifier provider
class UserNotifier extends StateNotifier<User>{
  UserNotifier(super.state){
    updateName('start');
  }

  void updateName(value){
    state = state.copyWith(name: value);
  }
  void updateAge( value){
    state = state.copyWith(age: value);
  }
}


//change notifier provider
class changeNotifier extends ChangeNotifier{
  User user = User(name: "abdus", age: 20);
  void updateName(String name){
    user = user.copyWith(name: name);
    notifyListeners();
  }
  void updateAge(int age){
    user = user.copyWith(age: age);
    notifyListeners();
  }
}

