import 'package:dokan/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/presentation/widgets/app_text.dart';
import '../widget/filter_bottom_sheet.dart';
import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        title: const AppText(
          title: 'Product List',
          fontSize: 22.6,
          fontWeight: FontWeight.w700,
          fontColor: Color(0xFF222455),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 23),
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(getProportionateScreenHeight(60)),
          child: Container(
            width: getProportionateScreenWidth(334),
            height: getProportionateScreenHeight(60),
            margin: const EdgeInsets.only(
                bottom: 10), // Adjust the margin as needed
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFD8D8D8),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _showFilterBottomSheet(context),
                  child: Row(
                    children: [
                      SizedBox(width: getProportionateScreenWidth(20)),
                      SvgPicture.asset(
                        'assets/images/filter.svg', // Replace with your filter icon asset path
                        height: 16,
                        width: 16,
                        colorFilter: const ColorFilter.mode(
                            Color(0xFF899AA2), BlendMode.srcIn),
                      ),
                      SizedBox(width: getProportionateScreenWidth(11)),
                      const Text(
                        'Filter',
                        style: TextStyle(
                          color: Color(0xFF899AA2),
                          fontSize: 15.63,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Sort By',
                      style: TextStyle(
                        color: Color(0xFF899AA2),
                        fontSize: 15.63,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(6.12)),
                    const Icon(
                      Icons.expand_more,
                      color: Color(0xFF899AA2),
                    ),
                    SizedBox(width: getProportionateScreenWidth(22.51)),
                    SvgPicture.asset(
                      'assets/images/list.svg', // Replace with your sort icon asset path
                      height: 16,
                      width: 16,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF222455), BlendMode.srcIn),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10.94)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.53,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const ProductCard();
          },
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      barrierColor: const Color(0xFF363636).withOpacity(0.35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: const FilterBottomSheetContent());
      },
    );
  }
}
