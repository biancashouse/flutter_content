import 'package:go_router/go_router.dart';

import 'router_provider.dart';

RouterProvider getRouterProvider() => WebRouterProvider();

class WebRouterProvider implements RouterProvider {
  @override
  GoRouter getWebOrMobileRouter(GoRouter webRouter, GoRouter mobileRouter) {
    // possibly inform user of new version
    // Useful.possiblyInformUserOfNewVersion().then((bool newVersion) {
    //   if (newVersion) {
    //     String? versionAndBuild = HydratedBloc.storage.read("versionAndBuild");
    //     if (versionAndBuild != null) {
    //       Callout.showTextToast(
    //         feature: 'new-version-available',
    //         msgText: "New version of this app loaded: $versionAndBuild",
    //         backgroundColor: Colors.lightBlue,
    //         textColor: Colors.white,
    //         removeAfterMs: 3000,
    //         gravity: Alignment.topCenter,
    //         width: Useful.scrW * .9,
    //       );
    //     }
    //   }
    // });
    return webRouter;
  }
}
