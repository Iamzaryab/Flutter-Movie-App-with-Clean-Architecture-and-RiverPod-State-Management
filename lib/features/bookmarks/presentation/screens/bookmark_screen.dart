import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/features/bookmarks/presentation/providers/bookmark_notifier_provider.dart';
import 'package:filmku/features/bookmarks/presentation/providers/state/bookmark_state.dart';
import 'package:filmku/features/bookmarks/presentation/widgets/bookmark_card.dart';


class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(bookmarkNotifierProvider.notifier).getBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    return Scaffold(
        body: bookmarkNotifier.state == BookmarkConcreteState.loaded
            ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: bookmarkNotifier.bookmarks.length,
            itemBuilder: (context, index) {
              return BookmarkCard(
                  movieDetail: bookmarkNotifier.bookmarks[index]);
            }
        )
            : bookmarkNotifier.state == BookmarkConcreteState.loading
            ? const Center(child: CircularProgressIndicator())
            :const Center(child: Text('No Bookmarks')),

        );
  }
}
