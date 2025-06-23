import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/TechBrotherYoutTube/multiProvider/todoApp/Item_model.dart';


final ItemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){
  return ItemNotifier();
});


class ItemNotifier extends StateNotifier<List<Item>>{
  ItemNotifier():super([]);

  void addItem(String name){
    final item = Item(id: DateTime.now().toString(), name: name);
    // state.add(item);
    // state = state.toList();
    state = [...state,item];
  }
  void deleteItem(String id){
    state = state.where((items)=>items.id!=id).toList();
  }

}
