import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/Feature/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/images/Animation_movie.json'));
  }

  Future<Null> navigateToHome() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const SimpleBottomNavigation();
          },
        ));
      },
    );
  }
}
