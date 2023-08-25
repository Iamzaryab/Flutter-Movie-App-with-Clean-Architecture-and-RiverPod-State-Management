
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmku/app/app_strings.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
// import 'package:filmku/shared/provider/app_theme_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // ref.read(appThemeProvider.notifier).toggleTheme();
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // ref.read(appThemeProvider.notifier).setDefaultTheme();
              // Handle item 2 tap
            },
          ),
        ],
      ),
    );
  }
}
