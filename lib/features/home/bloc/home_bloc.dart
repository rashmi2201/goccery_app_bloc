import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:goccery_app_bloc/data/cart_items.dart';
import 'package:goccery_app_bloc/data/grocery_data.dart';
import 'package:goccery_app_bloc/data/wishlist_items.dart';
import 'package:goccery_app_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //event handlers......

    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWislistButtonClickedEvent>(
        homeProductWislistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWhislistButtonNavigateEvent>(homeWhislistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  //methods created here......

  //make the product data model here....
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWislistButtonClickedEvent(
      HomeProductWislistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Whislist Product Clicked');
    //here you are passing the datat through event...
    wishlistItems.add(event.clickedProduct);

    //action is performing here....
    emit(HomeProductItemWhislistActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWhislistButtonNavigateEvent(
      HomeWhislistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Whislist Navigate  Clicked');
    //emit a state here.....
    emit(HomeNavigateToWhislistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Clicked');
    //emit a state here.....
    emit(HomeNavigateToCartPageActionState());
  }
}
