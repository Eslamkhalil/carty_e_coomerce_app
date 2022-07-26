import 'package:carousel_slider/carousel_slider.dart';
import 'package:carty_e_coomerce_app/presentation/widgets/custom_cached_image.dart';
import 'package:carty_e_coomerce_app/presentation/widgets/custom_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_cubit.dart';
import '../../business/cubits/change_product_faavorites_cubit/change_product_faavorites_state.dart';
import '../../business/cubits/get_categories_cubit/get_category_cubit.dart';
import '../../business/cubits/get_home_product_cubit/get_home_products_cubit.dart';
import '../../business/cubits/get_home_product_cubit/get_home_products_state.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/home_model.dart';
import '../widgets/build_product_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetHomeProductsCubit, GetHomeProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = GetHomeProductsCubit.get(context);
        final categories = GetCategoryCubit.get(context).categoriesModel;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              cubit.model != null
                  ? CarouselSlider(
                      items: cubit.model!.data!.banners
                          .map((e) => Stack(
                                children: [
                                  CustomCachedImage(
                                    imageUrl: e.image!,
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ))
                          .toList(),
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 500),
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                      ))
                  : const Center(child: CircularProgressIndicator()),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Category')),
              categories != null
                  ? buildCategoryItem(categories.data!.categoryData)
                  : const Center(child: CircularProgressIndicator()),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Products')),

              cubit.model != null &&
                      cubit.changeFavoritesCubit.favorites.isNotEmpty
                  ? CustomGridView(model: cubit.model!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        );
      },
    );
  }


/*
GridView.count(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 4.5,
                      childAspectRatio: 1 / 1.85,
                      children: List.generate(
                          cubit.model!.data!.products.length,
                          (index) => BuildProductItem(
                              model: cubit.model!.data!.products[index])),
                    )
 */


  Widget buildCategoryItem(List<CategoryData> category) => SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCachedImage(
                        imageUrl: category[index].image,
                        width: 45.0,
                        height: 45.0),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(category[index].name),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
          itemCount: category.length));
}
