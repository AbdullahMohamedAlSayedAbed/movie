import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          backgroundImage: profilePath != null
              ? CachedNetworkImageProvider(
                  ApiConstants.imageUrl(profilePath!))
              : null,
          child: profilePath == null
              ? const Icon(Icons.person, size: 50) // Icon shown if no image
              : null,
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
