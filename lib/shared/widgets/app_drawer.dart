
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/shared/bloc/theme/theme_bloc.dart';
import 'package:filmku/shared/bloc/theme/theme_event.dart';
import 'package:filmku/shared/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (context,state){
        return Drawer(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.sp),
                  bottomRight: Radius.circular(16.sp))),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/movies/drawer.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Text(
                    AppStrings.appName,
                    style:
                    context.textTheme.titleLarge!.copyWith(color: Colors.white),
                  )),
              SizedBox(height: AppDimens.p10),
              Padding(
                padding: EdgeInsets.only(top: AppDimens.p6, left: AppDimens.p20),
                child: Text(
                  'Colour Scheme',
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.theme.primaryColor),
                ),
              ),
              SizedBox(
                height: AppDimens.p20,
              ),
              DrawerItem(
                  title: 'Dark Mode',
                  asset: 'assets/images/icons/night.svg',
                  onTap: () => context.read<ThemeBloc>().add(const SetDarkThemeEvent()),
                  isSelected: state.selectedTheme=='dark'),
              DrawerItem(
                  title: 'Light Mode',
                  asset: 'assets/images/icons/sun.svg',
                  onTap: () => context.read<ThemeBloc>().add(const SetLightThemeEvent()),
                  isSelected: state.selectedTheme=='light'),
              DrawerItem(
                  title: 'Default System',
                  onTap: () => context.read<ThemeBloc>().add(const SetDefaultSystemThemeEvent()),
                  asset: 'assets/images/icons/default.svg',
                  isSelected: state.selectedTheme=='default'),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
