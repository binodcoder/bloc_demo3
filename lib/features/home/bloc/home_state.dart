import 'package:bloc_demo3/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class BlocInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
