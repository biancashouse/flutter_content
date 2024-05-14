import 'package:go_router/go_router.dart';
import 'router_provider_locator.dart'

if (dart.library.io) 'router_provider_mobile.dart'
if (dart.library.html) 'router_provider_web.dart' ;

// final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

abstract class RouterProvider {
  factory RouterProvider() => getRouterProvider();
  GoRouter getWebOrMobileRouter(GoRouter webRouter, GoRouter mobileRouter);

}