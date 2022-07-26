
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_cubit.dart';
import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_state.dart';
import '../../data/models/home_model.dart';
import 'custom_cached_image.dart';

class BuildProductItem extends StatelessWidget {
  const BuildProductItem({Key? key , required this.model}) : super(key: key);
  final dynamic model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.topRight, children: [
            CustomCachedImage(
                imageUrl: model.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain),
            if (model.discount != 0)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            buildFavIcon(modelId: model.id),
          ]),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${model.price.round()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16.0,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      if (model.oldPrice != 0)
                        Text(
                          '${model.oldPrice.round()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            letterSpacing: 0.1,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget buildFavIcon({required int modelId})=> BlocConsumer<ChangeFavoritesCubit, ChangeFavoritesState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return IconButton(
          onPressed: () {
            ChangeFavoritesCubit.get(context).changeFavorites(modelId);
          },
          icon: ChangeFavoritesCubit.get(context).favorites[modelId]!
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(
            Icons.favorite_border_outlined,
            color: Colors.grey,
          ));
    },
  );
}
