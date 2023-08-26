import 'dart:developer';

import 'package:filmku/shared/bloc/theme/theme_bloc.dart';
import 'package:filmku/shared/bloc/theme/theme_event.dart';
import 'package:filmku/shared/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/app/app_theme.dart';

import '../routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc()..add(const GetCurrentThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp.router(
                  title: AppStrings.appName,
                  darkTheme: AppTheme.darkTheme,
                  theme: AppTheme.lightTheme,
                  themeMode: state.currentTheme,
                  routerDelegate: AppRouter.router.routerDelegate,
                  routeInformationParser:
                      AppRouter.router.routeInformationParser,
                  routeInformationProvider:
                      AppRouter.router.routeInformationProvider,
                  debugShowCheckedModeBanner: false,
                );
              });
        },
      ),
    );
  }
}
