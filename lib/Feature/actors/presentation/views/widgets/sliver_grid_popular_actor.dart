import 'package:flutter/material.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/actor_item.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class SliverGridPopularActor extends StatelessWidget {
  const SliverGridPopularActor({
    super.key,
    required this.personEntity,
  });
  final List<PersonEntity>? personEntity;

  @override
  Widget build(BuildContext context) {
    if (personEntity == null || personEntity!.isEmpty) {
      return const CustomErrorWidget(
          errMessage: "No popular actors available.");
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3.8,
      ),
      itemBuilder: (context, index) {
        return ActorItem(
          personEntity: personEntity![index],
        );
      },
      itemCount: personEntity?.length ?? 0,
    );
  }
}
