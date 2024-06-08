import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/common/data/data_source/local/locale_source.dart';
import '../../features/common/data/data_source/local/token_source.dart';
import '../../features/common/data/repository_impl/locale_repo_impl.dart';
import '../../features/common/domain/repository/locale_repository.dart';
import '../../features/common/domain/usecase/locale_usecase.dart';
import '../../features/common/presentation/cubit/locale/locale_cubit.dart';
import '../../features/home/presentation/cubit/home_validation_cubit.dart';
import '../../features/sign_in/data/remote/sign_in_remote.dart';
import '../../features/sign_in/data/repository_impl/sign_in_repository_impl.dart';
import '../../features/sign_in/domain/repository/sign_in_repository.dart';
import '../../features/sign_in/domain/usecase/sign_in_usecase.dart';
import '../../features/sign_in/presentation/cubit/sign_in_cubit.dart';
import '../../features/sign_in/presentation/cubit/sign_in_validation_cubit.dart';
import '../../features/sign_up/data/remote/sign_up_remote.dart';
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl.dart';
import '../../features/sign_up/domain/repository/sign_up_repository.dart';
import '../../features/sign_up/domain/usecase/sign_up_usecase.dart';
import '../../features/sign_up/presentation/cubit/sign_up_cubit.dart';
import '../../features/sign_up/presentation/cubit/sign_up_validation_cubit.dart';
import '../header_provider/header_provider.dart';
import '../network/connection_checker.dart';

class Dependency {
  static final sl = GetIt.instance;
  Dependency._init();

  static Future<void> init() async {
//-------------------------------------------------------//
    sl.registerLazySingleton<LocaleSource>(() => LocaleSourceImpl(sl()));

    sl.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(sl()));
    sl.registerLazySingleton(() => ReadLocaleUsecase(sl()));
    sl.registerLazySingleton(() => SaveLocaleUsecase(sl()));
    sl.registerLazySingleton(() => LocaleCubit(
          readLocaleUsecase: sl(),
          saveLocaleUsecase: sl(),
        ));
    final sharedPref = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPref);
    sl.registerLazySingleton(() => Client());

    sl.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(),
    );
    sl.registerLazySingleton<TokenSource>(() => TokenSourceImpl(sl()));
    sl.registerLazySingleton<HeaderProvider>(() => HeaderProviderImpl());
    sl.registerLazySingleton(() => AuthHeaderProvider(sl()));

    sl.registerFactory(() => SignInValidationCubit());
    sl.registerFactory(() => HomeValidationCubit());

//---------------------------Sign Up Start-------------------------------//

    sl.registerLazySingleton<SignUpRemote>(
      () => SignUpRemoteImpl(sl()),
    );

    sl.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => SignUpUsecase(sl()));
    sl.registerFactory(() => SignUpCubit(signUpUsecase: sl()));

    sl.registerFactory(() => SignUpValidationCubit());

//---------------------------Sign Up End-------------------------------//



//---------------------------Sign In Start-------------------------------//

    sl.registerLazySingleton<SignInRemote>(
      () => SignInRemoteImpl(sl()),
    );

    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => SignInUsecase(sl()));
    sl.registerFactory(() => SignInApiCubit(signInUsecase: sl()));

//---------------------------Sign In End-------------------------------//
  }

  static final providers = <BlocProvider>[
    BlocProvider<LocaleCubit>(
      create: (context) => Dependency.sl<LocaleCubit>(),
    ),
    BlocProvider<SignInValidationCubit>(
      create: (context) => Dependency.sl<SignInValidationCubit>(),
    ),
    BlocProvider<HomeValidationCubit>(
      create: (context) => Dependency.sl<HomeValidationCubit>(),
    ),
    BlocProvider<SignInApiCubit>(
      create: (context) => Dependency.sl<SignInApiCubit>(),
    ),
    BlocProvider<SignUpValidationCubit>(
      create: (context) => Dependency.sl<SignUpValidationCubit>(),
    ),
    BlocProvider<SignUpCubit>(
      create: (context) => Dependency.sl<SignUpCubit>(),
    ),
  ];
}
