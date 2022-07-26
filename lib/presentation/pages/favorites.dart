import 'package:carty_e_coomerce_app/presentation/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_cubit.dart';
import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_state.dart';
import '../widgets/build_product_item.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeFavoritesCubit, ChangeFavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ChangeFavoritesCubit.get(context);
        return cubit.getFavoritesModel != null
            ? GridView.count(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 4.5,
                childAspectRatio: 1 / 1.85,
                children: List.generate(
                    cubit.getFavoritesModel!.data!.data!.length,
                    (index) => BuildProductItem(
                        model: cubit
                            .getFavoritesModel!.data!.data![index].product)),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
