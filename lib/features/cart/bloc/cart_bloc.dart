import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_demo3/data/cart_items.dart';
import 'package:bloc_demo3/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(BlocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
    //get your cartItems
    //check is your product model there in your
    //run a function to remove that product
    //emit cartItemRemovedState
  }
}
