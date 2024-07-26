part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class CardInitailEvent extends CardEvent {}

class CardRemoveFromCardEvent extends CardEvent {
  final ProductDataModel productDataModel;

  CardRemoveFromCardEvent({required this.productDataModel});
}
