import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/casts_cubit/casts_cubit.dart';
import 'package:movie/Feature/home/presentation/view/actor_info_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/cast_item_image_loading.dart';
import 'package:movie/Feature/home/presentation/view/widget/details_actors_item.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class ActorsListView extends StatelessWidget {
  const ActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastsCubit, CastsState>(
      builder: (context, state) {
        if (state is CastsSuccess) {
          if (state.casts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: SizedBox(
                height: 135,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.casts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ActorInfoView(
                              id: state.casts[index].id!,
                              name: state.casts[index].name!,
                            );
                          },
                        ));
                      },
                      child: Hero(
                        tag: state.casts[index].id.toString(),
                        child: ActorsItem(
                          profilePath: state.casts[index].profilePath,
                          name: state.casts[index].name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const CustomErrorWidget(
                errMessage: 'Sorry ,No Cast For This');
          }
        } else if (state is CastsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: SizedBox(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CastItemImageLoading();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 15,
                      ),
                  itemCount: 15),
            ),
          );
        }
      },
    );
  }
}
