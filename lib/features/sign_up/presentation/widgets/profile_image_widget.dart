

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size_config.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getProportionateScreenWidth(121.53),
          height: getProportionateScreenHeight(121.53),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x1A395AB8),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFFFFFFFF),
            child: SvgPicture.asset(
              'assets/images/person.svg',
              color: const Color(0xFF7C8592),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: getProportionateScreenWidth(34.11),
              height: getProportionateScreenHeight(34.11),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A395AB8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
