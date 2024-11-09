import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/cast_item_image_loading.dart';
import 'package:movie/core/constants/api_constants.dart';

class ActorsItem extends StatelessWidget {
  const ActorsItem({super.key, this.profilePath});

  final String? profilePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // GoRouter.of(context)
        //     .push(AppRouter.kActorProfileView, extra: castsModel.id);
      },
      child: CircleAvatar(
        radius: 50,
        backgroundImage: profilePath != null
            ? CachedNetworkImageProvider(ApiConstants.imageUrl(profilePath!))
            : null,
        child: profilePath == null
            ? const Icon(Icons.person, size: 50) // Icon shown if no image
            : null,
      ),
    );
  }
}
