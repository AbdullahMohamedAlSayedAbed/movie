import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/casts_cubit/casts_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/build_app_bar.dart';
import 'package:movie/Feature/home/presentation/view/widget/actor_profile_screen.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class ActorInfoView extends StatelessWidget {
  const ActorInfoView({super.key, required this.id, required this.name});
  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CastsCubit>(),
      child: Scaffold(
        appBar: buildAppBar(title: name),
        body: SafeArea(child: ActorInfoViewBody(id: id)),
      ),
    );
  }
}

class ActorInfoViewBody extends StatefulWidget {
  const ActorInfoViewBody({super.key, required this.id});
  final int id;
  @override
  State<ActorInfoViewBody> createState() => _ActorInfoViewBodyState();
}

class _ActorInfoViewBodyState extends State<ActorInfoViewBody> {
  @override
  void initState() {
    context.read<CastsCubit>().getActorInfo(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastsCubit, CastsState>(
      builder: (context, state) {
        if (state is ActorInfoFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is ActorInfoSuccess) {
          return ActorProfileScreen(actor: state.actorInfo);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
