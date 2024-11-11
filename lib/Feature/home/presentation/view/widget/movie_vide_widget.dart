import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/videos_cubit/videos_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/movie_video_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieVideWidget extends StatelessWidget {
  const MovieVideWidget({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosCubit, VideosState>(
      builder: (context, state) {
        if (state is VideosSuccess) {
          return GestureDetector(
            onTap: () {
              _launchUrl(state.videos[0].key);
            },
            child: const MovieVideoButton(),
          );
        }
        return const SizedBox();
      },
    );
  }

  Future<void> _launchUrl(String key) async {
    Uri url = Uri.parse('https://www.youtube.com/watch?v=$key');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
