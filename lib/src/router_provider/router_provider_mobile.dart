import 'package:go_router/go_router.dart';

import 'router_provider.dart';

RouterProvider getRouterProvider() => MobileRouterProvider();

class MobileRouterProvider implements RouterProvider {
  @override
  GoRouter getWebOrMobileRouter(GoRouter webRouter, GoRouter mobileRouter) => mobileRouter;
}
