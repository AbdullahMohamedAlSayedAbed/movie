import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/core/utils/app_styles.dart';

class PopularAndTopRatedDetailsMovie extends StatelessWidget {
  const PopularAndTopRatedDetailsMovie({
    super.key, required this.movie,
  });
  final HomeEntity movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 164,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            movie.title,
            style: AppStyles.styles19W500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffFF7878),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                 movie.releaseDate!.split('-')[0],
                  style: AppStyles.styles14W400,
                ),
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text((movie.voteAverage / 2).toStringAsFixed(1),
                      style: AppStyles.styles16W500white70),

                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
           Text(
            movie.overview!,
            style: AppStyles.styles16W500white70,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
