import 'package:dokan/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/app_button.dart';
import '../../../common/presentation/widgets/app_text.dart';

class FilterBottomSheetContent extends StatefulWidget {
  const FilterBottomSheetContent({super.key});

  @override
  FilterBottomSheetContentState createState() =>
      FilterBottomSheetContentState();
}

class FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
  String selectedFilter = 'Newest';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(27),
          ),
          Center(
            child: Container(
              width: getProportionateScreenWidth(47),
              height: getProportionateScreenHeight(3),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD3DD),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: AppText(
                title: 'Filter',
                fontColor: Color(0xFF000000),
                fontSize: 17.36,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.16),
          ),
          _buildFilterOption('Newest'),
          _buildFilterOption('Oldest'),
          _buildFilterOption('Price low > High'),
          _buildFilterOption('Price high > Low'),
          _buildFilterOption('Best selling'),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                title: 'Cancel',
                width: getProportionateScreenWidth(145),
                height: getProportionateScreenHeight(60),
                color: Colors.transparent,
                fontColor: const Color(0xFF607374),
                borderColor: const Color(0xFF979797),
                fontSize: 17.36,
                fontWeight: FontWeight.w700,
              ),
              AppButton(
                title: 'Apply',
                width: getProportionateScreenWidth(145),
                height: getProportionateScreenHeight(60),
                color: const Color(0xFF1ABC9C),
                fontSize: 17.36,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return SizedBox(
      height: getProportionateScreenHeight(40),
      child: ListTile(
        leading: SizedBox(
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenHeight(24),
          child: Checkbox(
            value: selectedFilter == title,
            onChanged: (bool? value) {
              setState(() {
                selectedFilter = title;
              });
            },
            activeColor: const Color(0xFFFF708A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            side: const BorderSide(
              color: Color(0xFFFF708A),
            ),
          ),
        ),
        title: AppText(title: title),
        onTap: () {
          setState(() {
            selectedFilter = title;
          });
        },
      ),
    );
  }
}
