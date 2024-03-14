import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeeemj/core/routes/app_router.dart';
import 'package:teeeemj/core/theme/theme.dart';
import 'package:teeeemj/cubit/auth_cubit/auth_cubit.dart';
import 'package:teeeemj/cubit/beer_cubit.dart';
import 'package:teeeemj/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:teeeemj/cubit/sign_in/sign_in_cubit.dart';
import 'package:teeeemj/cubit/theme_cubit/theme_cubit.dart';
import 'package:teeeemj/firebase_options.dart';
import 'package:teeeemj/repository/auth_repository/auth_repository.dart';
import 'package:teeeemj/repository/beer_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BeerCubit(BeerRepository()),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SignInCubit(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ResetPasswordCubit(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme:
                  state.brightness == Brightness.dark ? darkTheme : lightTheme,
              routerConfig: AppRouter().config(),
            );
          },
        ),
      ),
    );
  }
}
