import 'package:flutter/material.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/actor_item.dart';

class SliverGridPopularActor extends StatelessWidget {
  const SliverGridPopularActor({
    super.key,
    required this.personEntity,
  });
  final List<PersonEntity> personEntity;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2 / 4),
        itemBuilder: (context, index) => ActorItem(
              personEntity: personEntity[index],
            ),
        itemCount: personEntity.length);
  }
}
