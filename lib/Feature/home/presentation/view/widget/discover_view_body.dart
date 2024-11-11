import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_discover_grid_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/discover_success_grid_view_builder.dart';
import 'package:movie/core/utils/functions/build_show_toast_functions.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class DiscoverViewBody extends StatefulWidget {
  const DiscoverViewBody({super.key, required this.id});
  final int id;

  @override
  State<DiscoverViewBody> createState() => _DiscoverViewBodyState();
}

class _DiscoverViewBodyState extends State<DiscoverViewBody> {
  List<HomeEntity> discoverMovies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGenresCubit, GetGenresState>(
      listener: (context, state) {
        if (state is GetDiscoverPaginationFailure) {
          buildShowToastFunction(message: state.errMessage);
        }
        if (state is GetDiscoverSuccess) {
          discoverMovies.addAll(state.discoverMovies);
        }
      },
      builder: (context, state) {
        if (state is GetDiscoverSuccess ||
            state is GetDiscoverPaginationLoading ||
            state is GetDiscoverPaginationFailure) {
          return DiscoverSuccessGridViewBuilder(
              id: widget.id,
              discoverMovies: discoverMovies);
        }
        if (state is GetDiscoverFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }

        return const CustomLoadingDiscoverGridView();
      },
    );
  }
}
