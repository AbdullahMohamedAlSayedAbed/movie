import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/view/movie_detail_view.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class DiscoverItemWidget extends StatelessWidget {
  const DiscoverItemWidget({super.key, required this.movieEntity});
  final HomeEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MovieDetailView(id: movieEntity.id);
          },
        ));
      },
      child: Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: CachedNetworkImage(
                imageUrl: ApiConstants.imageUrl(movieEntity.image ?? ""),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CustomLoading(
                  enabled: true,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Container(
                      color: Colors.grey[300], // لون Skeleton للصورة
                    ),
                  ),
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),
            Text(
              movieEntity.title,
              style: AppStyles.styles16W500,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
