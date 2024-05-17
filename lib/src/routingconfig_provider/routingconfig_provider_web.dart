import 'package:go_router/go_router.dart';

import 'routingconfig_provider.dart';

RoutingConfigProvider getRoutingConfigProvider() => WebRoutingConfigProvider();

class WebRoutingConfigProvider implements RoutingConfigProvider {
  @override
  RoutingConfig getWebOrMobileRoutingConfig(RoutingConfig webRoutingConfig, RoutingConfig mobileRoutingConfig) {
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
    return webRoutingConfig;
  }
}
