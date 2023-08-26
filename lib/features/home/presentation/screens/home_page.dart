
import 'package:filmku/features/home/presentation/screens/home_page_view.dart';
import 'package:filmku/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => NotificationBloc()..add(GetAllNotificationsEvent())),
    ], child: const HomePageView()
    );
  }

}

