import 'package:dokan/core/utils/size_config.dart';
import 'package:dokan/features/home/presentation/cubit/home_validation_cubit.dart';
import 'package:dokan/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../profile/presentation/pages/profile_page.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'menu_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? accessToken;
  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  getAccessToken() async {
    context.read<HomeValidationCubit>().getToken();
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // accessToken = sharedPreferences.getString("access_token");
    // print(accessToken);
  }

  Widget _getSelectedPage(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const MenuPage();
      case 2:
        return const CartPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<HomeValidationCubit, HomeValidationState>(
      builder: (context, state) {
        final accessToken = state.accessToken;
        if (accessToken != '') {
          final selectedIndex = state.selectedIndex;
          return Scaffold(
            body: _getSelectedPage(selectedIndex),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              width: getProportionateScreenWidth(56),
              height: getProportionateScreenHeight(55.31),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF679B),
                    Color(0xFFFF7B51),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Icon(Icons.search, color: Colors.white, size: 30),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD8D8D8),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                  right: Radius.circular(12),
                ),
                child: BottomAppBar(
                  color: const Color(0xFFFFFFFF),
                  shadowColor: const Color(0xFFD8D8D8),
                  height: getProportionateScreenHeight(64),
                  shape: const CircularNotchedRectangle(),
                  elevation: 0,
                  notchMargin: 4.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeValidationCubit>()
                              .setSelectedIndex(0);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/home.svg',
                          width: getProportionateScreenWidth(25.69),
                          height: getProportionateScreenHeight(23.32),
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 0
                                ? const Color(0xFFFF679B)
                                : const Color(0xFF6E7FAA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeValidationCubit>()
                              .setSelectedIndex(1);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/menu.svg',
                          width: getProportionateScreenWidth(22),
                          height: getProportionateScreenHeight(22),
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 1
                                ? const Color(0xFFFF679B)
                                : const Color(0xFF6E7FAA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeValidationCubit>()
                              .setSelectedIndex(2);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/cart.svg',
                          width: getProportionateScreenWidth(22.57),
                          height: getProportionateScreenHeight(24.01),
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 2
                                ? const Color(0xFFFF679B)
                                : const Color(0xFF6E7FAA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeValidationCubit>()
                              .setSelectedIndex(3);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/person.svg',
                          width: getProportionateScreenWidth(15.16),
                          height: getProportionateScreenHeight(22),
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 3
                                ? const Color(0xFFFF679B)
                                : const Color(0xFF6E7FAA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
