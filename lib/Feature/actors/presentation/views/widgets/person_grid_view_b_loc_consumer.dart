import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_popular_cubit/person_popular_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/sliver_grid_popular_actor.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_discover_grid_view.dart';
import 'package:movie/core/utils/functions/build_show_toast_functions.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class PersonGridViewBLocConsumer extends StatefulWidget {
  const PersonGridViewBLocConsumer({
    super.key,
  });

  @override
  State<PersonGridViewBLocConsumer> createState() =>
      _PersonGridViewBLocConsumerState();
}

class _PersonGridViewBLocConsumerState
    extends State<PersonGridViewBLocConsumer> {
  List<PersonEntity> personEntity = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonPopularCubit, PersonPopularState>(
      listener: (context, state) {
        if (state is PersonPopularFailure) {
          buildShowToastFunction(message: state.errMessage);
        }
        if (state is PersonPopularSuccess && state.personPopularList != null) {
          setState(() {
            personEntity.addAll(state.personPopularList!);
          });
        }
      }, builder: (context, state) {
        if (personEntity.isNotEmpty ||
            state is PersonPopularPaginationLoading ||
            state is PersonPopularPaginationFailure) {
          return SliverGridPopularActor(personEntity: personEntity);
        }
        if (state is PersonPopularFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        return const CustomLoadingDiscoverGridView();
      },
    );
  }
}
