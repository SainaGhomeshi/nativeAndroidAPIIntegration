import 'package:native_android_api_integration/presentation/pages/color_page.dart';
import 'package:native_android_api_integration/presentation/pages/home_page.dart';
import 'package:routemaster/routemaster.dart';

/// Defines the base routing paths within the app.
///
/// Should generally be limited to the root pages of each [RouteMap].
class InitialPageRoutes {
  static const root = '/';
  static const notFound = '/404';
  static const loading = '/loading';

  // main routes
  static const home = '/home';
}

/// Defines the available page route names.
///
/// Valid paths should be declared within the relevant [PageRoutes] value.
/// When [Routemaster.push] is invoked with a [RelativePageRoute], it
/// will be treated as a relative path to the current path, and push the
/// page on top.
///
/// Pushing a page with a leading `/` implies an absolute path, so this
/// will replace the current navigation stack with the new route path.
///
/// See [Routemaster.push] for more information.
class RelativePageRoutes {
  static const colorPage = 'colorPage';
}

class PageRoutes {
  static final home = RouteMap(
    routes: {InitialPageRoutes.home: (routeData) => const HomePage(),
    // `/home/colorPage
    '${InitialPageRoutes.home}/${RelativePageRoutes.colorPage}':
        (routeData) {
      return const ColorPage();
      },
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.home),
  );

}
