import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/main_view.dart';
import 'package:movie/core/utils/app_storage.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';
import 'package:movie/core/widgets/custom_bloc_opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
   await AppStorage().initHive();
  Bloc.observer = CustomBlocObserver();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SimpleBottomNavigation(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      )
    );
  }
}
