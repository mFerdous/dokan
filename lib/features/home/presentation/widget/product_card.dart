import 'package:dokan/core/utils/size_config.dart';
import 'package:dokan/features/common/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    const int ratingCount = 4;
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
              'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                const AppText(
                  title: 'Girls Stylish Dresses...',
                  fontSize: 13.89,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.14,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4.0),
                ),
                Row(
                  children: [
                    const AppText(
                        title: '\$150',
                        lineThrough: true,
                        fontColor: Color(0xFF989FA8),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14),
                    SizedBox(
                      width: getProportionateScreenWidth(8.0),
                    ),
                    const AppText(
                        title: '\$79',
                        fontColor: Color(0xFF000000),
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
                        color: index < ratingCount
                            ? Colors.amber
                            : const Color(0xFFD3D8E5),
                        size: 14,
                      );
                    },
                  ),
                ),

                // Row(
                //   children: [
                //     Icon(Icons.star, color: Colors.amber, size: 14),
                //     Icon(Icons.star, color: Colors.amber, size: 14),
                //     Icon(Icons.star, color: Colors.amber, size: 14),
                //     Icon(Icons.star, color: Colors.amber, size: 14),
                //     Icon(Icons.star, color: Color(0xFFD3D8E5), size: 14),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
