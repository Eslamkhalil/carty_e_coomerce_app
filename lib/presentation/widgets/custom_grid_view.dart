
import 'package:carty_e_coomerce_app/data/models/home_model.dart';
import 'package:flutter/material.dart';

import 'build_product_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.model}) : super(key: key);
 final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 4.5,
      childAspectRatio: 1 / 1.85,
      children: List.generate(
          model.data!.products.length,
              (index) => BuildProductItem(
              model: model.data!.products[index])),
    );
  }
}
