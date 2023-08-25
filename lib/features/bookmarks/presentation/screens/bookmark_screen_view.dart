import 'package:filmku/features/bookmarks/presentation/bloc/bookmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmku/features/bookmarks/presentation/widgets/bookmark_card.dart';

class BookmarkScreenView extends StatefulWidget {
  const BookmarkScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookmarkScreenViewState();
}

class _BookmarkScreenViewState extends State<BookmarkScreenView> {
  @override
  void initState() {
    super.initState();
    context.read<BookmarkBloc>().add(const GetBookmarksEvent());
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        return Scaffold(
          body: state.state == BookmarkConcreteState.loaded
              ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.bookmarks.length,
              itemBuilder: (context, index) {
                return BookmarkCard(movieDetail: state.bookmarks[index]);
              })
              : state.state == BookmarkConcreteState.loading
              ? const Center(child: CircularProgressIndicator())
              : const Center(child: Text('No Bookmarks')),
        );
      },
    );
  }
}
