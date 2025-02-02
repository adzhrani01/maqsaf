import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../mixins/paginate_mixin.dart';

class PagingAdapter<T> with PagingMixin<T> {
  PagingController<int, T> pagingController = PagingController(firstPageKey: 0);
  PagingAdapter({ required this.fetchItems});
  // Future<void> Function (BuildContext context, {required int? pageKey}) fetchItems;
  Future<void> Function (BuildContext context, {required int? skipCount}) fetchItems;
  @override
  Future<void> getItems(BuildContext context, {required int? skipCount})=>fetchItems(context,skipCount:skipCount);
  // Future<void> getItems(BuildContext context, {required int? pageKey})=>fetchItems(context,pageKey:pageKey);

  void refresh(){
    baseModel=null;
    pagingController.refresh();
  }
  int? loadPaginate(Function ()? onRefresh,Function ()? onFirst,Function ()? onNextPage){
    int? nextPage=getNextPage(pagingController);
    if (nextPage == null) {
      onRefresh!=null?onRefresh():'';
     return null;
    }
    if(nextPage<=0){
      if(pagingController.itemList?.isNotEmpty??false) {
        return null;
      }
      onFirst!=null?onFirst():'';
    }
    else{
      onNextPage!=null?onNextPage():'';
    }
    return nextPage;
  }


  void init(){
    pagingController.dispose();
   pagingController = PagingController(firstPageKey: 0);
  }
  void dispose(){
    pagingController.dispose();
  }
}