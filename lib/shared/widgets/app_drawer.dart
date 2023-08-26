import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/shared/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:filmku/shared/provider/app_theme_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeState = ref.watch(appThemeProvider);
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
              onTap: () => _onTap('dark', ref),
              isSelected: currentThemeState.selectedTheme=='dark'),
          DrawerItem(
              title: 'Light Mode',
              asset: 'assets/images/icons/sun.svg',
              onTap: () => _onTap('light', ref),
              isSelected: currentThemeState.selectedTheme=='light'),
          DrawerItem(
              title: 'Default System',
              onTap: () => _onTap('default', ref),
              asset: 'assets/images/icons/default.svg',
              isSelected: currentThemeState.selectedTheme=='default'),
          const Divider(),
        ],
      ),
    );
  }

  void _onTap(String which, WidgetRef ref) {
    switch (which) {
      case 'dark':
        {
          ref.read(appThemeProvider.notifier).setDarkTheme();
        }
        break;
      case 'light':
        {
          ref.read(appThemeProvider.notifier).setLightTheme();
        }
        break;
      case 'default':
        {
          ref.read(appThemeProvider.notifier).setDefaultTheme();
        }
        break;
    }
  }
}

