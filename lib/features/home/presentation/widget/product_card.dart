// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dokan/core/utils/size_config.dart';
import 'package:dokan/features/common/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(
              product.permalink,
              height: getProportionateScreenHeight(177),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: product.name,
                  fontSize: 13.89,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.14,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Row(
                  children: [
                    AppText(
                        title: '\$${product.regularPrice}',
                        lineThrough: true,
                        fontColor: const Color(0xFF989FA8),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14),
                    SizedBox(
                      width: getProportionateScreenWidth(8.0),
                    ),
                    AppText(
                        title: '\$${product.price}',
                        fontColor: const Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.16),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Icon(
                        Icons.star,
                        color: index < double.parse(product.averageRating)
                            ? Colors.amber
                            : const Color(0xFFD3D8E5),
                        size: 14,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
