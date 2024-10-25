import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';

import 'package:movie/Feature/home/presentation/view/home_view.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';
import 'package:movie/core/widgets/custom_bloc_opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(HomeEntityAdapter());
  Bloc.observer = CustomBlocObserver();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      )
    );
  }
}
