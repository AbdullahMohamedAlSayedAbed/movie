import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/cast_item_image_loading.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/app_styles.dart';

class ActorsItem extends StatelessWidget {
  const ActorsItem({super.key, this.profilePath, this.name});

  final String? profilePath;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: ClipOval(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CastItemImageLoading(),
              imageUrl: ApiConstants.imageUrl(profilePath ?? ''),
              errorWidget: (context, url, error) => const Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 100,
          child: Text(name ?? 'no name',
              style: AppStyles.styles18W500,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
