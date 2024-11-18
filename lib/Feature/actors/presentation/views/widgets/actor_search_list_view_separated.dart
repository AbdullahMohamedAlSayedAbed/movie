import 'package:flutter/material.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/home/presentation/view/actor_info_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/details_actors_item.dart';

class ActorSearchListViewSeparated extends StatelessWidget {
  const ActorSearchListViewSeparated({
    super.key,
    required this.personSearchList,
  });
  final List<PersonEntity> personSearchList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: personSearchList.length,
        itemBuilder: (context, index) {
          return  InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ActorInfoView(
                    id: personSearchList[index].id,
                    name: personSearchList[index].name??'no name',
                  );
                },
              ));
            },
            child: Hero(
              tag: personSearchList[index].id.toString(),
              child: ActorsItem(
                profilePath: personSearchList[index].profilePath??
                    personSearchList[index].knownFor[0].posterPath,
                name: personSearchList[index].name,
              ),
            ),
          );
        },
      ),
    );
  }
}
