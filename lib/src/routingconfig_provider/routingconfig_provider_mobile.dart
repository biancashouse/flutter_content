import 'package:go_router/go_router.dart';

import 'routingconfig_provider.dart';

RoutingConfigProvider getRouterProvider() => MobileRoutingConfigProvider();

class MobileRoutingConfigProvider implements RoutingConfigProvider {
  @override
  RoutingConfig getWebOrMobileRoutingConfig(RoutingConfig webRoutingConfig, RoutingConfig mobileRoutingConfig) => mobileRoutingConfig;
}
