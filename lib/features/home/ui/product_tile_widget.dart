import 'package:bloc_demo3/features/home/bloc/home_event.dart';
import 'package:bloc_demo3/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    required this.productDataModel,
    required this.homeBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                productDataModel.imageUrl,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(productDataModel.name),
        Text(productDataModel.description),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${productDataModel.price}'),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: Icon(Icons.favorite_border)),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
