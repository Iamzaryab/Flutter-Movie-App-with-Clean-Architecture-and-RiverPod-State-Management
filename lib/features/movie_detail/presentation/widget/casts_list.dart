
import 'package:filmku/features/movie_detail/presentation/bloc/casts/casts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:filmku/features/movie_detail/presentation/widget/cast_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CastsList extends StatelessWidget {
  final int id;

  const CastsList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CastsBloc>().add(GetCastsEvent(movieId: id));
    return BlocBuilder<CastsBloc,CastsState>(
      builder: (context,state){
        return state.state == CastConcreteState.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: state.casts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CastItem(
                cast: state.casts[index],
              );
            });
      },
    );

  }
}
