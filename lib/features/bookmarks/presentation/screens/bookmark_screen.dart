import 'package:filmku/features/bookmarks/presentation/bloc/bookmark_bloc.dart';
import 'package:filmku/features/bookmarks/presentation/screens/bookmark_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> BookmarkBloc(),
        child: const BookmarkScreenView(),
    );
  }


  }

