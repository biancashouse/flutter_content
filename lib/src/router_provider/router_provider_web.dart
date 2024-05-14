import 'package:go_router/go_router.dart';

import 'router_provider.dart';

RouterProvider getRouterProvider() => WebRouterProvider();

class WebRouterProvider implements RouterProvider {
  @override
  GoRouter getWebOrMobileRouter(GoRouter webRouter, GoRouter mobileRouter) => webRouter;
}
