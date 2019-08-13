import 'package:esellglobe/widget/products.dart';
import 'reduxAction.dart';

List<CartItem> cartItemsReducer(List< CartItem> items, dynamic action){
  if(action is AddItemAction){
    return addItem(items, action);
  }
  else if(action is ToggleStateItemAction){
    return toogleState(items, action);
  }
  else if( action is DeleteItemAction){
    return deleteItem(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action){
  return new List.from(items)..add(action.item);  
}

List<CartItem> toogleState(List<CartItem> items, ToggleStateItemAction action){
  List<CartItem> newItems = items.map((items)=> item.name == action.item.name? action.item:items);
  return newItems;
}

List<CartItem> deleteItem(List<CartItem> items, DeleteItemAction action){
  return new List.from(items)..remove(action.item);  
}