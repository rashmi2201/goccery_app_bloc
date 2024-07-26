part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

//passing product list here.....
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWhislistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

//these are the action sate of your product....

class HomeProductItemWhislistActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
