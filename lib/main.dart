import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_android_api_integration/blocs/app/app_bloc.dart';
import 'package:native_android_api_integration/core/theme/app_theme.dart';
import 'package:native_android_api_integration/routes/page_routes.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const AppWrapper());
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(),
      child: const App(),
    );
  }
}
class App extends StatefulWidget {
  const App({
    Key? key,
    //we can use required this.lockTimeout,
  }) : super(key: key);

  @override
  AppStateClass createState() => AppStateClass();
}

class AppStateClass extends State<App> {
  late final RoutemasterDelegate routemaster;

  @override
  void initState() {
    routemaster = RoutemasterDelegate(
      routesBuilder: (context) {
        final state = BlocProvider.of<AppBloc>(context).state;
        if (state is StartReadingState) {
          return PageRoutes.home;
        } else {
          return PageRoutes.home;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp.router(
          key: ObjectKey(state),
          title: 'Integration',
          theme: AppTheme.appTheme(),
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: routemaster,
        );
      },
    );
  }
}


