import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/movie_detail/movie_detail_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_image_details.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_movie_data_detail.dart';
import 'package:movie/Feature/home/presentation/view/widget/movie_detail_loading_widget.dart';
import 'package:movie/core/utils/app_styles.dart';

class AllDetailsMovie extends StatelessWidget {
  const AllDetailsMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailSuccess) {
            return Column(
              children: [
                CustomImageDetails(
                  id: state.movieDetail.id,
                  imageUrl: state.movieDetail.backdropPath,
                ),
                CustomMovieDataDetail(
                  movie: state.movieDetail,
                ),
              ],
            );
          }
          if (state is MovieDetailFailure) {
            return SafeArea(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(state.errMessage, style: AppStyles.errorTextStyle),
              )),
            );
          } else {
            return const MovieDetailLoadingWidget();
          }
        },
      ),
    );
  }
}
