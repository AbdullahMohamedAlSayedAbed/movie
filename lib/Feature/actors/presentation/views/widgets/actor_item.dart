import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/home/presentation/view/actor_info_view.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({super.key, this.personEntity});
  final PersonEntity? personEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActorInfoView(
                id: personEntity?.id ?? 0,
                name: personEntity?.name ?? '',
              ),
            ));
      },
      child: Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Hero(
                tag: personEntity!.id.toString(),
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imageUrl(
                    personEntity?.profilePath ??
                        (personEntity!.knownFor.isNotEmpty
                            ? personEntity?.knownFor[0].posterPath
                            : '')!,
                  ),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CustomLoading(
                    enabled: true,
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Container(
                        color: Colors.grey[300],
                      ),
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
              personEntity?.name ?? 'no name',
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
