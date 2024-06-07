// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dokan/core/utils/size_config.dart';
import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:dokan/features/common/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(64),
              ),
              SizedBox(
                height: getProportionateScreenHeight(26),
                child: const AppText(
                  title: 'My Account',
                  fontSize: 22.6,
                  fontWeight: FontWeight.w700,
                  fontColor: Color(0xFF222455),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              const DashedCircleAvatar(
                radius: 66,
                imageUrl:
                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              const AppText(
                title: 'John Smith',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontColor: Color(0xFF222455),
              ),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              const AppText(
                title: 'info@johnsmith.com',
                fontSize: 16,
                fontColor: Color(0xFF535353),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: getProportionateScreenWidth(1),
                  ),
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          leading: SvgPicture.asset(
                            'assets/images/person.svg',
                            width: getProportionateScreenWidth(17.86),
                            height: getProportionateScreenHeight(22.32),
                          ),
                          title: const AppText(
                            title: 'Account',
                            fontWeight: FontWeight.w400,
                            fontSize: 17.4,
                            letterSpacing: 0.2,
                            fontColor: Color(0xFF000000),
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.expand_more
                                : Icons.chevron_right,
                            color: const Color(0xFF899AA2),
                          ),
                          onExpansionChanged: (bool expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      title: 'Email',
                                      fontColor:
                                          Color(0xFF263238).withOpacity(0.56),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  buildTextField(
                                    'youremail@xmail.com',
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      title: 'Full Name',
                                      fontColor:
                                          Color(0xFF263238).withOpacity(0.56),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  buildTextField(
                                    'William Bennett',
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      title: 'Street Address',
                                      fontColor:
                                          Color(0xFF263238).withOpacity(0.56),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  buildTextField(
                                    '465 Nolan Causeway Suite 079',
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      title: 'Apt, Suite, Bldg (optional)',
                                      fontColor:
                                          Color(0xFF263238).withOpacity(0.56),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  buildTextField(
                                    'Unit 512',
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                      title: 'Zip Code',
                                      fontColor:
                                          Color(0xFF263238).withOpacity(0.56),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  buildTextField(
                                    '77017',
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppButton(
                                        title: 'Cancel',
                                        width: getProportionateScreenWidth(135),
                                        height:
                                            getProportionateScreenHeight(50),
                                        color: Colors.transparent,
                                        fontColor: Color(0xFF607374),
                                        borderColor: Color(0xFF979797),
                                        fontSize: 17.36,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      AppButton(
                                        title: 'save',
                                        width: getProportionateScreenWidth(135),
                                        height:
                                            getProportionateScreenHeight(50),
                                        color: Color(0xFF1ABC9C),
                                        fontSize: 17.36,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(286),
                        height: getProportionateScreenHeight(1),
                        color: const Color(0xFFA0A9BD).withOpacity(0.31),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/lock.svg',
                          width: getProportionateScreenWidth(17.86),
                          height: getProportionateScreenHeight(22.32),
                        ),
                        title: const AppText(
                          title: 'Passwords',
                          fontWeight: FontWeight.w400,
                          fontSize: 17.4,
                          letterSpacing: 0.2,
                          fontColor: Color(0xFF000000),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF899AA2),
                        ),
                        onTap: () {},
                      ),
                      Container(
                        width: getProportionateScreenWidth(286),
                        height: getProportionateScreenHeight(1),
                        color: const Color(0xFFA0A9BD).withOpacity(0.31),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/notification.svg',
                          width: getProportionateScreenWidth(17.86),
                          height: getProportionateScreenHeight(22.32),
                        ),
                        title: const AppText(
                          title: 'Notification',
                          fontWeight: FontWeight.w400,
                          fontSize: 17.4,
                          letterSpacing: 0.2,
                          fontColor: Color(0xFF000000),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF899AA2),
                        ),
                        onTap: () {},
                      ),
                      Container(
                        width: getProportionateScreenWidth(286),
                        height: getProportionateScreenHeight(1),
                        color: const Color(0xFFA0A9BD).withOpacity(0.31),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/heart.svg',
                          width: getProportionateScreenWidth(17.86),
                          height: getProportionateScreenHeight(22.32),
                        ),
                        title: const AppText(
                          title: 'Wishlist (00)',
                          fontWeight: FontWeight.w400,
                          fontSize: 17.4,
                          letterSpacing: 0.2,
                          fontColor: Color(0xFF000000),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF899AA2),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: getProportionateScreenWidth(287),
        height: getProportionateScreenHeight(52),
        padding: const EdgeInsets.only(left: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF263238).withOpacity(0.12),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            // labelText: labelText,
            hintText: hintText,
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 17.36,
            fontWeight: FontWeight.w400,
            height: getProportionateScreenHeight(1),
            letterSpacing: 0.15782825648784637,
          ),
        ),
      ),
    );
  }
}

class DashedCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const DashedCircleAvatar({
    super.key,
    required this.radius,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(radius * 2),
      height: getProportionateScreenHeight(radius * 2),
      child: CustomPaint(
        painter: DashedCirclePainter(radius: radius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: radius - 4,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final double radius;
  DashedCirclePainter({
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 10.0;
    double dashSpace = 10.0;
    final paint = Paint()
      ..color = const Color(0xFFFFADAD)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double startAngle = 0.0;
    double sweepAngle = dashWidth / (2 * radius);
    while (startAngle < 2 * 3.141592653589793) {
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle + (dashSpace / (2 * radius));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
