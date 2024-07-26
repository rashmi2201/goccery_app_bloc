import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goccery_app_bloc/features/card/bloc/card_bloc.dart';
import 'package:goccery_app_bloc/features/card/ui/cart_tile_widget.dart';

import '../../home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CardBloc cardBloc = CardBloc();
  @override
  void initState() {
    super.initState();
    cardBloc.add(CardInitailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CardBloc, CardState>(
        bloc: cardBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CardActionState,
        buildWhen: (previous, current) => current is! CardActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CardSuccessState:
              final successState = state as CardSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CardTileWidget(
                        productDataModel: successState.cartItems[index],
                        cardBloc: cardBloc);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
