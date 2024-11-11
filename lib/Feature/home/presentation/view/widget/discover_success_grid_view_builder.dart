import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/discover_item_widget.dart';

class DiscoverSuccessGridViewBuilder extends StatefulWidget {
  const DiscoverSuccessGridViewBuilder({
    super.key,
    required this.discoverMovies,
    required this.id,
  });
  final int id;
  final List<HomeEntity> discoverMovies;

  @override
  State<DiscoverSuccessGridViewBuilder> createState() =>
      _DiscoverSuccessGridViewBuilderState();
}

class _DiscoverSuccessGridViewBuilderState
    extends State<DiscoverSuccessGridViewBuilder> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * .8) {
        context.read<GetGenresCubit>().getDiscoverMovies(widget.id);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2 / 4),
        itemCount: widget.discoverMovies.length,
        itemBuilder: (context, index) {
          return DiscoverItemWidget(
            movieEntity: widget.discoverMovies[index],
          );
        });
  }
}
