import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:goccery_app_bloc/data/cart_items.dart';
import 'package:goccery_app_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardInitailEvent>((cardInitailEvent));
    on<CardRemoveFromCardEvent>(cardRemoveFromCardEvent);
  }

//it is emitting your success state..........
  FutureOr<void> cardInitailEvent(
      CardInitailEvent event, Emitter<CardState> emit) {
    emit(CardSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cardRemoveFromCardEvent(
      CardRemoveFromCardEvent event, Emitter<CardState> emit) {
    cartItems.remove(event.productDataModel);

    emit(CardSuccessState(cartItems: cartItems));
  }
}
