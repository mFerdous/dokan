import 'package:dokan/core/routes/routes.dart';
import 'package:dokan/core/theme/theme.dart';
import 'package:dokan/features/home/presentation/pages/landing_page.dart';
import 'package:dokan/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/resources/string_res.dart';
import 'core/utils/dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/lang/app_localizations.dart';
import 'features/common/presentation/cubit/check_installation.dart';
import 'features/common/presentation/cubit/locale/locale_cubit.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Dependency.init();

  bool isFirstTime = await CheckInstallation.isFirstTime();

  if (isFirstTime) {
    await CheckInstallation.setLaunched();
  }
  FlutterNativeSplash.remove();
  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  MyApp({super.key, required this.isFirstTime});
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Dependency.providers,
      child: _buildMaterialApp(),
    );
  }

  BlocBuilder<LocaleCubit, LocaleState> _buildMaterialApp() {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.lightTheme,
          onGenerateRoute: _appRoute.onGenerateRoute,
          supportedLocales: _supportedLocale,
          localizationsDelegates: _localizationDelegates,
          localeResolutionCallback: localeResolution,
          locale: state.getCurrentLocale(),
          home: isFirstTime ? SignUpPage() : LandingPage(),
        );
      },
    );
  }

  final _supportedLocale = [
    const Locale(StringRes.kLangCodeEN, StringRes.kLangCountryUS),
    const Locale(StringRes.kLangCodeBN, StringRes.kLangCountryBD),
  ];

  final _localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  Locale localeResolution(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
