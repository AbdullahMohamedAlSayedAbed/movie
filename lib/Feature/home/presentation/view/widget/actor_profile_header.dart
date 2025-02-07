import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/actor_entity.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class ActorProfileHeader extends StatelessWidget {
  final ActorEntity actor;

  const ActorProfileHeader({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: actor.id.toString(),
          child: CircleAvatar(
            radius: 100,
            child: ClipOval(
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const CustomLoading(
                        child: CircleAvatar(
                  radius: 100,
                )),
                imageUrl: ApiConstants.imageUrl(actor.profilePath ?? ''),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.person, size: 150),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              actor.name,
              style: AppStyles.styles24.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text('Birthday: ${actor.birthday ?? 'N/A'}',
                style: AppStyles.styles18W500.copyWith(color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}
