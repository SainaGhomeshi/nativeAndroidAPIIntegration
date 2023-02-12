import 'package:flutter/material.dart';
import 'package:native_android_api_integration/presentation/views/home_view.dart';

class HomePage extends Page<void> {
  const HomePage() : super();
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) =>
          //  BlocProvider<HomeBloc>(
          //   create: (context) => HomeBloc()
          //     ..add(
          //       const HomeContentLoad(),
          //     ),
          //   child: const
          const HomeView(),
    );
  }
}
