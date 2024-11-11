import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/actor_entity.dart';
import 'package:movie/Feature/home/presentation/view/widget/actor_profile_header.dart';
import 'package:movie/Feature/home/presentation/view/widget/actors_movies_sections.dart';
import 'package:movie/Feature/home/presentation/view/widget/address_section.dart';
import 'package:movie/Feature/home/presentation/view/widget/biography_section.dart';
import 'package:movie/core/utils/app_styles.dart';

class ActorProfileScreen extends StatefulWidget {
  final ActorEntity actor;

  const ActorProfileScreen({super.key, required this.actor});

  @override
  _ActorProfileScreenState createState() => _ActorProfileScreenState();
}

class _ActorProfileScreenState extends State<ActorProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ActorProfileHeader(actor: widget.actor),
                  const SizedBox(height: 20),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child:
                          BiographySection(biography: widget.actor.biography)),
                  const SizedBox(height: 20),
                  AddressSection(address: widget.actor.address),
                  const SizedBox(height: 20),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Movies',
                      style: AppStyles.styles23W700,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const ActorsMoviesSections(),
        ],
      ),
    );
  }
}
